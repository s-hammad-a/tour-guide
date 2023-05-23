import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/logo.jpg"), fit: BoxFit.fill)
        ),
        alignment: Alignment.bottomCenter,
        child: const Padding(
          padding: EdgeInsets.only(bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "TOGU",
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF8F967A),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Smart Tour Guide",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF8F967A)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
