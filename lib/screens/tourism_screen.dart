import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TourismScreen extends StatelessWidget {
  const TourismScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          Expanded(
            child: Stack(
              children: [
                Image.asset(
                  "assets/travel_plans.jpg",
                  width: size.width,
                  fit: BoxFit.fill,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        const Expanded(child: SizedBox.shrink()),
                        IconButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Colors.white)
                          ),
                          icon: const Icon(
                            Icons.bookmark_add_outlined,
                            color: Colors.black,
                            size: 20,
                          ),
                          onPressed: () {  },
                        ),
                        const SizedBox(width: 10,),
                      ],
                    ),
                    const Expanded(child: SizedBox.shrink()),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "TOGU for tourism",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
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
                    const SizedBox(height: 10,),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: const Color(0xAA8496A2),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
