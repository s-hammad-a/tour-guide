import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

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
            "Available Restaurants",
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
                  Navigator.pushNamed(context, '/detailScreen', arguments: {
                    "name" : "Zafran Indian Bistro",
                  });
                },
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(image: AssetImage("assets/resterent.jpg"), fit: BoxFit.fitWidth)
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Zafran Indian Bistro",
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
                    "name" : "Mamo",
                  });
                },
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(image: AssetImage("assets/mamo.webp"), fit: BoxFit.fitWidth)
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Mamo",
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
                    "name" : "Cipriani",
                  });
                },
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(image: AssetImage("assets/Cipriani.jpg"), fit: BoxFit.fitWidth)
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Cipriani",
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
                    "name" : "IL baretto",
                  });
                },
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(image: AssetImage("assets/ILbaretto.jpg"), fit: BoxFit.fitWidth)
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "IL baretto",
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
          const SizedBox(height: 30,),
        ],
      ),
    );
  }
}