import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:togu/screens/home_screen.dart';
import 'package:togu/screens/log_in_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if(user == null) {
      return const LoginScreen();
    }
    else {
      return const HomeScreen();
    }
  }
}