import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:privacychat/core/model/user/user_model.dart';
import 'package:privacychat/core/services/rsa/rsa_service.dart';
import 'package:uuid/uuid.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference userRef =
      FirebaseFirestore.instance.collection('users');
  Logger logger = Logger();

  Future<void> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        logger.e('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        logger.e('Wrong password provided for that user.');
      } else {
        logger.e(e.message);
      }
    }
  }

  Future<void> signUp(String name, String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await createUserDB(userCredential, name);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        logger.e('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        logger.e('The account already exists for that email.');
      } else {
        logger.e(e.message);
      }
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  Future<void> createUserDB(
    UserCredential userCredential,
    String name,
  ) async {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    User user = userCredential.user!;
    String username =
        Uuid().v4().toString().replaceAll("-", "").substring(0, 10);
    String publicKey = await RsaService().generateKeyPair();

    UserModel userModel = UserModel(
      uid: user.uid,
      name: name,
      username: username,
      email: user.email ?? "error",
      publicKey: publicKey,
      createdAt: currentTime,
      updatedAt: currentTime,
      lastSeenAt: currentTime,
    );

    await userRef.doc(user.uid).set(userModel.toJson());
  }
}
