import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<User?> logIn(String email, String password) async {
  final String? errorMessage;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);

    debugPrint("Login Sucessfull");
    firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get()
        .then((value) => userCredential.user!.updateDisplayName(value['name']));

    return userCredential.user;
  } on FirebaseAuthException catch (error) {
    switch (error.code) {
      case "invalid - email":
        errorMessage = "your email address appers to be malformed";
        break;
      case "wrong- password":
        errorMessage = "your password is wrong.";
        break;

      case "user-not-found":
        errorMessage = "User with this email doesn't exist.";
        break;
      case "user-disabled":
        errorMessage = "User with this email has been disabled.";
        break;
      case "too-many-requests":
        errorMessage = "Too many requests";
        break;
      case "operation-not-allowed":
        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      default:
        errorMessage = "An undefined Error happened.";
    }
    Fluttertoast.showToast(msg: errorMessage);
    debugPrint(error.code);
  }
  // catch (e) {
  //   debugPrint('$e');
  //   return null;
  // }
}

// Future logOut(BuildContext context) async {
//   FirebaseAuth auth = FirebaseAuth.instance;

//   try {
//     await auth.signOut().then((value) {
//       Navigator.push(context, MaterialPageRoute(builder: (_) =>const LoginScreen()));
//     });
//   } catch (e) {
//     debugPrint("error");
//   }
// }
