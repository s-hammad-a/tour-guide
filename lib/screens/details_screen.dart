import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    if(args == null) {
      Navigator.pop(context);
    }
    String name = args['name'].toString();
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
                  name == "Mamo" ? "assets/mamo.webp" : name == "Zafran Indian Bistro" ? "assets/resterent.jpg" : name == "Riyadh Bus" ? "assets/bus.jpg" : name == "Taxi Terminal" ? "assets/Riyadh-taxi.webp" : name == "YELO" ? "assets/yelo.jpeg" : name == "Boulevard World" ? "assets/Gltlnipw-boulevard.jpg" : name == "National Museum of Saudi Arabia" ? "assets/Saa.webp" : "assets/travel_plans.jpg",
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
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        name,
                        style: const TextStyle(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Location And Contact",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      const SizedBox(width: 10,),
                      const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 20,
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {  },
                          child: const Text(
                            "Al Batha,Al Batha Street,opposite Al Ramad Hotel, Riyadh",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                decoration: TextDecoration.underline
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30,),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      const SizedBox(width: 10,),
                      const Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 20,
                      ),
                      Expanded(
                        child: TextButton(
                          style: const ButtonStyle(
                            alignment: Alignment.centerLeft
                          ),
                          onPressed: () {
                            launchUrl(Uri(scheme: 'tel', path: '920000877'));
                          },
                          child: const Text(
                            "920000877",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              decoration: TextDecoration.underline
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30,),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
