import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_rsa/fast_rsa.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:privacychat/core/services/rsa/rsa_service.dart';

class ChatCacheManager {
  static const _boxName = 'chat_cache';
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final RsaService rsaService = RsaService();

  // Initialize the cache
  Future<void> initCache() async {
    List<int> encryptionKey = await rsaService.getHiveEncryptionKey();

    await Hive.openBox(
      _boxName,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }

  // Get cached messages for a chatroom
  Future<List<Map<String, dynamic>>> getCachedMessages(String roomId) async {
    final box = Hive.box(_boxName);

    // Safely cast the data to List<Map<String, dynamic>>
    final rawMessages = box.get(roomId, defaultValue: []);
    return (rawMessages as List)
        .map((e) => Map<String, dynamic>.from(e))
        .toList();
  }

// Cache new messages for a chatroom
  Future<void> cacheMessages(
      String roomId, List<Map<String, dynamic>> messages) async {
    final box = Hive.box(_boxName);

    // Retrieve and properly cast current messages
    List<Map<String, dynamic>> currentMessages =
        await getCachedMessages(roomId);

    // Merge new messages with existing ones (avoid duplicates)
    final messageIds = currentMessages.map((msg) => msg['messageId']).toSet();
    final newMessages =
        messages.where((msg) => !messageIds.contains(msg['messageId']));

    currentMessages.addAll(newMessages);
    await box.put(roomId, currentMessages);
  }

  // Stream messages with caching and avoid redundant decryption
  Stream<List<Map<String, dynamic>>> streamAndCacheMessages(
      String roomId) async* {
    await initCache();

    // Emit cached messages first
    List<Map<String, dynamic>> cachedMessages = await getCachedMessages(roomId);
    yield cachedMessages;

    // Fetch Firestore messages and process them
    await for (var snapshot in firestore
        .collection('chatroom')
        .doc(roomId)
        .collection('members')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('messages')
        .orderBy('createdAt', descending: false)
        .snapshots()) {
      String? privateKey = await rsaService.getPrivateKey();

      List<Map<String, dynamic>> decryptedMessages = [];
      List<Map<String, dynamic>> toCache = [];

      for (var doc in snapshot.docs) {
        try {
          var messageId = doc['messageId'];
          var encryptedMessage = doc['message'];
          var senderUid = doc['senderUid'];
          var timestamp = doc['createdAt'];

          // Skip already cached messages
          if (cachedMessages.any((msg) => msg['messageId'] == messageId)) {
            continue;
          }

          // Decrypt the message
          var decryptedMessage = await RSA.decryptOAEP(
            encryptedMessage,
            'utf-8',
            Hash.SHA256,
            privateKey!,
          );

          // Prepare the message for use and caching
          final messageData = {
            'messageId': messageId,
            'message': decryptedMessage,
            'senderUid': senderUid,
            'createdAt': timestamp,
          };

          decryptedMessages.add(messageData);
          toCache.add(messageData);
        } catch (e) {
          print('Failed to decrypt message: $e');
        }
      }

      // Cache newly decrypted messages
      if (toCache.isNotEmpty) {
        await cacheMessages(roomId, toCache);
        cachedMessages.addAll(toCache); // Update cachedMessages in memory
      }

      // Emit all messages (cached + new)
      yield cachedMessages;
    }
  }
}
