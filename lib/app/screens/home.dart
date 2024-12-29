import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:privacychat/app/auth/service/auth_service.dart';
import 'package:privacychat/app/screens/chat.dart';
import 'package:privacychat/app/screens/search.dart';
import 'package:privacychat/core/services/rsa/rsa_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () async {
              await AuthService().signOut();
            },
            icon: Icon(Icons.logout_rounded),
          ),
          IconButton(
            onPressed: () async {
              await RsaService().generateHiveSecureKey();
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchPage(),
              maintainState: true,
              allowSnapshotting: true,
            ),
          );
        },
        child: Icon(Icons.search_rounded),
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text("SOMETHING WENT WRONG"),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!["chatsIds"].length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data!["chatsIds"][index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(
                          roomId: snapshot.data!["chatsIds"][index],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
