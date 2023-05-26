import 'package:flutter/material.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({Key? key}) : super(key: key);

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
            "Places to Visit",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detailScreen', arguments: {
                    "name" : "Boulevard World",
                  });
                },
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(image: AssetImage("assets/Gltlnipw-boulevard.jpg"), fit: BoxFit.fitWidth)
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Boulevard World",
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detailScreen', arguments: {
                    "name" : "National Museum of Saudi Arabia",
                  });
                },
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(image: AssetImage("assets/Saa.webp"), fit: BoxFit.fitWidth)
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "National Museum of Saudi Arabia",
                    textAlign: TextAlign.center,
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
          const Expanded(flex: 2, child: SizedBox.shrink()),
          const SizedBox(height: 30,),
        ],
      ),
    );
  }
}