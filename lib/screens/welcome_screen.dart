import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFDCE3D3),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(size.height/3), bottomLeft: Radius.circular(size.height/3)),
              color: Colors.white,
            ),
            height: size.height/3,
          ),
          const Expanded(child: SizedBox.shrink()),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 30),
            child: Text(
              "Enjoy your stay and viewing the great sights of the city. Enjoy the best experience with us!",
              style: TextStyle(
                color: Color(0xFF8F967A),
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 30),
            child: TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xFFA5AA94)),
                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 20, horizontal: 30)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))))
              ),
              onPressed: () {

              },
              child: const Text(
                "Get Started",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 30),
            child: TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0x00A5AA94)),
                // padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 20, horizontal: 30)),
                // shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))))
              ),
              onPressed: () {

              },
              child: const Text(
                "Create Account",
                style: TextStyle(
                  color: Color(0xFF6F7C42),
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(
                    color: Color(0xFF8F967A),
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 5,),
                TextButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Color(0x00A5AA94)),
                    padding: MaterialStatePropertyAll(EdgeInsets.zero),
                    // shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))))
                  ),
                  onPressed: () {

                  },
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      color: Color(0xFF6F7C42),
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}
