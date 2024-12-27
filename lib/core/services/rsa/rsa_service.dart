import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_rsa/fast_rsa.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

class RsaService {
  final storage = FlutterSecureStorage();
  final auth = FirebaseAuth.instance;
  Logger logger = Logger();

  // generate key pair and store it securely
  Future<String> generateKeyPair() async {
    if (await getPublicKey() != null || await getPrivateKey() != null) {
      String? publicKey = await getPublicKey();
      return publicKey!;
    }

    var keys = await RSA.generate(2048);
    User user = auth.currentUser!;

    await storage.write(
      key: '${user.uid}_privateKey',
      value: keys.privateKey,
    );

    await storage.write(
      key: '${user.uid}_publicKey',
      value: keys.publicKey,
    );

    return keys.publicKey;
  }

  // get public key
  Future<String?> getPublicKey() async {
    User user = auth.currentUser!;
    String? publicKey = await storage.read(key: '${user.uid}_publicKey');
    return publicKey;
  }

  // get private key
  Future<String?> getPrivateKey() async {
    User user = auth.currentUser!;
    String? privateKey = await storage.read(key: '${user.uid}_privateKey');
    return privateKey;
  }

  // encrypt message with public key
  Future<String> encryptMessage(
      String message, String receiverPublicKey) async {
    var data = RSA.encryptOAEP(
      message,
      'utf-8',
      Hash.SHA256,
      receiverPublicKey,
    );

    return data;
  }

  // decrypt message with private key in bulk

// Stream and decrypt messages
  Stream<List<Map<String, dynamic>>> streamAndDecryptMessages(
      String roomId, String privateKey) {
    // Stream Firestore messages
    return FirebaseFirestore.instance
        .collection('chatroom')
        .doc(roomId)
        .collection('members')
        .doc(auth.currentUser!.uid)
        .collection('messages')
        .orderBy('createdAt', descending: false) // Order messages by time
        .snapshots()
        .map((snapshot) async {
      // Decrypt all messages in bulk
      List<Map<String, dynamic>> decryptedMessages = [];
      for (var doc in snapshot.docs) {
        try {
          // Fetch encrypted message data
          var encryptedMessage = doc['message']; // Encrypted message text
          var senderUid = doc['senderUid']; // Sender's UID
          var timestamp = doc['createdAt']; // Message timestamp

          // Decrypt message
          var decryptedMessage = await RSA.decryptOAEP(
            encryptedMessage,
            'utf-8',
            Hash.SHA256,
            privateKey,
          );

          // Add decrypted message to list
          decryptedMessages.add({
            'message': decryptedMessage,
            'senderUid': senderUid,
            'createdAt': timestamp,
          });
        } catch (e) {
          print('Failed to decrypt message: $e'); // Log any decryption errors
        }
      }

      return decryptedMessages;
    }).asyncMap((future) => future); // Convert List<Future> to Stream
  }
}
