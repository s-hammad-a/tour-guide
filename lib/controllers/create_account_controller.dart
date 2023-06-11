import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../firebase/firebase_auth.dart';

class CreateAccountProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  final DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child('/');

  String checkCredentials() {
    if(nameController.text.isEmpty) {
      return "Enter a Name";
    }
    else if(emailController.text.isEmpty) {
      return "Enter an email";
    }
    else if(phoneController.text.isEmpty) {
      return "Enter a Phone Number";
    }
    else if(passwordController.text.isEmpty || rePasswordController.text.isEmpty) {
      return "Enter a valid password";
    }
    else if(passwordController.text != rePasswordController.text) {
      return "Password do not match";
    }
    else {
      return "done";
    }
  }

  Future<bool> createAccount(BuildContext context) async {
    bool check =  await AuthService().registerWithEmailAndPassword(emailController.text, passwordController.text, nameController.text, context).then((value) async {
      if(value) {
        await databaseReference.child(AuthService().auth.currentUser!.uid).set({
          "Reservations" : "",
          "Saved" : "",
        }).onError((error, stackTrace) {
          print(error.toString());
        });
        return true;
      }
      else {
        return false;
      }
    }).onError((error, stackTrace) {
      return false;
    });
    await AuthService().auth.currentUser!.updatePhotoURL("${phoneController.text}||||");
    return check;
  }
}