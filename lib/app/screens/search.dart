import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:privacychat/app/screens/chat.dart';
import 'package:privacychat/core/model/user/user_model.dart';
import 'package:privacychat/core/services/chat/room/chatroom_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("users")
              .where("uid",
                  isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .limit(25)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var user = snapshot.data!.docs[index];
                UserModel data = UserModel.fromJson(user.data());

                return Card(
                  child: ListTile(
                    title: Text(data.name),
                    subtitle: Text("@${data.username}"),
                    onTap: () async {
                      await ChatRoomService()
                          .createChatRoom(
                            data.uid,
                            data.publicKey,
                          )
                          .then(
                            (value) => context.mounted
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ChatPage(roomId: value),
                                    ),
                                  )
                                : null,
                          );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
