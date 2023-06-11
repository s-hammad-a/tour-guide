import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // create user object based on firebase user
  User? _userFromFirebaseUser(User? user)
  {
    // ignore: unnecessary_null_comparison
    return user;
  }

  //auth change user stream

  Stream<User?> get user {
    return auth.authStateChanges()
        .map(_userFromFirebaseUser);
  }

  //register with email and password
  Future<bool> registerWithEmailAndPassword(String email, String password, String name, BuildContext context) async {
    try{
      UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      await user!.updateDisplayName(name);
      return true;
    }
    on FirebaseAuthException catch  (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xFFBFB6AA),
            shape: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF545454), width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            titlePadding: EdgeInsets.zero,
            title: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF8F967A),
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              ),
              padding: const EdgeInsets.only(left: 20),
              height: 40,
              child: const Row(
                children: [
                  Icon(
                    Icons.warning_amber,
                    size: 20,
                    color: Colors.red,
                  ),
                  SizedBox(width: 10,),
                  Text(
                    'Warning',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            content: SizedBox(
              width: 300,
              child: Text(
                e.message!.split("Firebase: ")[1].split(" (")[0],
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Color(0xFF8F967A))
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Okay',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
      );
      print(e.toString());
      return false;
    }
  }

  //sign up with email and password
  Future<User?> signInWithEmailAndPassword(String email, String password, BuildContext context) async {
    try{
      UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    }
    on FirebaseAuthException catch  (e) {
      print(e.message);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xFFBFB6AA),
            shape: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF545454), width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            titlePadding: EdgeInsets.zero,
            title: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF8F967A),
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              ),
              padding: const EdgeInsets.only(left: 20),
              height: 40,
              child: const Row(
                children: [
                  Icon(
                    Icons.warning_amber,
                    size: 20,
                    color: Colors.red,
                  ),
                  SizedBox(width: 10,),
                  Text(
                    'Warning',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            content: SizedBox(
              width: 300,
              child: Text(
                e.message!,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Color(0xFF8F967A))
                ),
                onPressed: () async {

                  Navigator.pop(context);
                },
                child: const Text(
                  'Okay',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
      );
      print(e.toString());
      return null;
    }
  }


  // sign out
  Future signOut() async {
    try {
      return await auth.signOut();
    }
    catch(e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  String getMessageFromErrorCode(String errorCode) {
    switch (errorCode) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email already used. Go to login page.";
        break;
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Wrong email/password combination.";
        break;
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "No user found with this email.";
        break;
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return "User disabled.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return "Too many requests to log into this account.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        return "Server error, please try again later.";
        break;
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email address is invalid.";
        break;
      default:
        return "Login failed. Please try again.";
        break;
    }
  }
}