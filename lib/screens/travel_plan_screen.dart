import 'package:flutter/material.dart';

class TravelPlanScreen extends StatelessWidget {
  const TravelPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCE3D3),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Smart Tour Guide",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20
          ),
        ),
        backgroundColor: const Color(0xFF8F967A),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30,),
          const Text(
            "TOGU Travel Plans",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/tourismScreen');
                },
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(image: AssetImage("assets/travel_plans.jpg"), fit: BoxFit.fitWidth)
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "TOGU for tourism",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        shadows: [
                          Shadow( // bottomLeft
                              offset: Offset(-1.5, -1.5),
                              color: Colors.black
                          ),
                          Shadow( // bottomRight
                              offset: Offset(1.5, -1.5),
                              color: Colors.black
                          ),
                          Shadow( // topRight
                              offset: Offset(1.5, 1.5),
                              color: Colors.black
                          ),
                          Shadow( // topLeft
                              offset: Offset(-1.5, 1.5),
                              color: Colors.black
                          ),
                        ]
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Expanded(flex: 3, child: SizedBox.shrink()),
          const SizedBox(height: 30,),
        ],
      ),
    );
  }
}