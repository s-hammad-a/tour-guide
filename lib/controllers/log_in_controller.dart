import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController resetEmailController = TextEditingController();
  String helperText = "";

  bool checkInfo() {
    if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(resetEmailController.text)) {
      helperText = "";
      notifyListeners();
      return true;
    }
    else {
      helperText = "Invalid Email";
      notifyListeners();
      return false;
    }
  }

}