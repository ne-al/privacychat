import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:privacychat/core/services/rsa/rsa_service.dart';
import 'package:uuid/uuid.dart';

class MessageService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference chatroomRef =
      FirebaseFirestore.instance.collection('chatroom');

  // send message
  Future<void> sendMessage(String message, String roomId,
      String receiverPublicKey, String receiverUid) async {
    String? currentUserPublicKey = await RsaService().getPublicKey();

    String encryptedMessageReceiver = await RsaService().encryptMessage(
      message,
      receiverPublicKey,
    );

    String encryptedMessageSender = await RsaService().encryptMessage(
      message,
      currentUserPublicKey!,
    );

    int currentTime = DateTime.now().millisecondsSinceEpoch;
    String messageId = Uuid().v4();

    Map<String, dynamic> generateMessage(bool forSender) {
      String message =
          forSender ? encryptedMessageSender : encryptedMessageReceiver;
      Map<String, dynamic> messageData = {
        'messageId': messageId,
        'message': message,
        'senderUid': auth.currentUser!.uid,
        "isRead": false,
        "readAt": null,
        'createdAt': currentTime,
      };
      return messageData;
    }

    await chatroomRef
        .doc(roomId)
        .collection("members")
        .doc(auth.currentUser!.uid)
        .collection("messages")
        .doc(messageId)
        .set(generateMessage(true));

    await chatroomRef
        .doc(roomId)
        .collection("members")
        .doc(receiverUid)
        .collection("messages")
        .doc(messageId)
        .set(generateMessage(false));
  }
}
