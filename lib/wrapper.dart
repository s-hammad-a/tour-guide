import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:togu/controllers/home_screen_controller.dart';
import 'package:togu/screens/city_screen.dart';
import 'package:togu/screens/home_screen.dart';
import 'package:togu/screens/log_in_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user == null) {
      return const LoginScreen();
    } else {
      if(user.email!.contains("@togu.com")) {
        Provider.of<HomeScreenProvider>(context, listen: false).currentIndex = 0;
      }
      else {
        Provider.of<HomeScreenProvider>(context, listen: false).currentIndex = 1;
      }
      return const CityScreen();
    }
  }
}
