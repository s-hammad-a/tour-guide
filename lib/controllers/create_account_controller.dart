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

  bool checkPassword() {
    return (passwordController.text.length > 6 && passwordController.text == rePasswordController.text);
  }

  Future<bool> createAccount() async {
    bool check =  await AuthService().registerWithEmailAndPassword(emailController.text, passwordController.text, nameController.text).then((value) async {
      print("hasfashhhh");
      // await databaseReference.child('/').push().set({
      //   AuthService().auth.currentUser!.uid : "null",
      // }).onError((error, stackTrace) {
      //   print(error.toString());
      // });
      await databaseReference.child(AuthService().auth.currentUser!.uid).set({
        "Reservations" : "",
      }).onError((error, stackTrace) {
        print(error.toString());
      });
      print("hhhhhh");
      return true;
    }).onError((error, stackTrace) {
      return false;
    });
    await AuthService().auth.currentUser!.updatePhotoURL(phoneController.text);
    return check;
  }
}