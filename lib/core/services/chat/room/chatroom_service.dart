import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:privacychat/core/model/chatroom/chatroom_model.dart';
import 'package:privacychat/core/services/rsa/rsa_service.dart';

class ChatRoomService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference chatroomRef =
      FirebaseFirestore.instance.collection("chatroom");
  final CollectionReference userRef =
      FirebaseFirestore.instance.collection("users");

  // generate chatroom id
  String generateChatRoomId(String receiverUid) {
    List<String> ids = [auth.currentUser!.uid, receiverUid];
    ids.sort();
    String roomId = ids.join("_");

    return roomId;
  }

  // check if chatroom exist
  Future<bool> isChatRoomExist(String receiverUid) async {
    String roomId = generateChatRoomId(receiverUid);
    DocumentSnapshot snapshot = await chatroomRef.doc(roomId).get();
    return snapshot.exists;
  }

  // create a new chatroom
  Future<String> createChatRoom(
    String receiverUid,
    String receiverPublicKey,
  ) async {
    String roomId = generateChatRoomId(receiverUid);
    if (await isChatRoomExist(receiverUid)) return roomId;
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    ChatroomModel chatroom = ChatroomModel(
      roomId: roomId,
      name: "",
      description: "",
      createdBy: auth.currentUser!.uid,
      lastMessageAt: currentTime,
      createdAt: currentTime,
      updatedAt: currentTime,
      usersUid: [
        auth.currentUser!.uid,
        receiverUid,
      ],
    );

    await chatroomRef.doc(roomId).set(chatroom.toJson());

    // create a document for each user

    String? currentUserPublicKey = await RsaService().getPublicKey();

    // sender version
    await chatroomRef
        .doc(roomId)
        .collection("members")
        .doc(auth.currentUser!.uid)
        .set({
      "uid": auth.currentUser!.uid,
      "name": receiverUid,
      "publicKey": currentUserPublicKey,
      "unreadMessages": 0,
      "isTyping": false,
      "isArchived": false,
      "isDeleted": false,
      "isMuted": false,
    });

    // receiver version
    await chatroomRef.doc(roomId).collection("members").doc(receiverUid).set({
      "uid": receiverUid,
      "name": auth.currentUser!.uid,
      "publicKey": receiverPublicKey,
      "unreadMessages": 0,
      "isTyping": false,
      "isArchived": false,
      "isDeleted": false,
      "isMuted": false,
    });

    await userRef.doc(auth.currentUser!.uid).update({
      "chatsIds": FieldValue.arrayUnion([roomId])
    });

    await userRef.doc(receiverUid).update({
      "chatsIds": FieldValue.arrayUnion([roomId])
    });

    return roomId;
  }

  // get chatroom data
  Future<ChatroomModel> getChatroomData(String roomId) async {
    var data = await chatroomRef.doc(roomId).get();

    ChatroomModel model =
        ChatroomModel.fromJson(data.data()! as Map<String, dynamic>);

    return model;
  }

  Future<Map<String, dynamic>> getReceiverData(String roomId) async {
    ChatroomModel model = await getChatroomData(roomId);

    List ids = model.usersUid;
    String receiverUid = ids[0] == auth.currentUser!.uid ? ids[1] : ids[0];

    var snapshot = await userRef.doc(receiverUid).get();
    var data = snapshot.data() as Map<String, dynamic>?; // Cast the data

    if (data == null) {
      throw Exception("User data not found for receiverUid: $receiverUid");
    }

    String receiverPublicKey = data["publicKey"];

    return {
      "receiverUid": receiverUid,
      "receiverPublicKey": receiverPublicKey,
    };
  }
}
