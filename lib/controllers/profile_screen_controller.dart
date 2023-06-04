import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:togu/firebase/firebase_auth.dart';

class ProfileScreenProvider extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController fullName = TextEditingController();
  String image = "assets/placeholder.png";
  String url = " ";
  bool updateButton = false;

  bool checkInfo() {
    return (email.text.isNotEmpty && phone.text.isNotEmpty && fullName.text.isNotEmpty);
  }
  void updateImage() {
    url = AuthService().auth.currentUser!.photoURL!;
    notifyListeners();
  }
  Future<void> updateInfo(BuildContext context, User? user) async {
    if(checkInfo()) {
      if(AuthService().auth.currentUser!.displayName != fullName.text) {
        await AuthService().auth.currentUser !.updateDisplayName(fullName.text);
      }
      await AuthService().auth.currentUser!.updatePhotoURL("${phone.text}||||${AuthService().auth.currentUser!.photoURL!.split("||||")[1]}");
      await user!.reload();
      updateButton = false;
      if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email.text)) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Invalid Email"),
        ));
        updateButton = true;
      }
      else if(AuthService().auth.currentUser!.email != email.text) {
        await AuthService().auth.currentUser !.updateEmail(email.text);
      }
      notifyListeners();
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Invalid Data"),
      ));
    }
  }

  void setUpdateButton(bool value) {
    updateButton = value;
    notifyListeners();
  }
}