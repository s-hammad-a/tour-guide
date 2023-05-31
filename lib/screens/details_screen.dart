import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:togu/controllers/detail_screen_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    if(args == null) {
      Navigator.pop(context);
    }
    String name = args['name'].toString();
    Provider.of<DetailScreenProvider>(context, listen: false).name = name;
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
      body: FutureBuilder(
        future: Provider.of<DetailScreenProvider>(context, listen: false).getFromDatabase(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return Column(
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
                        context.watch<DetailScreenProvider>().details['desc'] != null ? const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                          ),
                        ) : const SizedBox.shrink(),
                        context.watch<DetailScreenProvider>().details['desc'] != null ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            const SizedBox(width: 10,),
                            const Icon(
                              Icons.description,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                context.watch<DetailScreenProvider>().details['desc'].toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(width: 30,),
                          ],
                        ) : const SizedBox.shrink(),
                        context.watch<DetailScreenProvider>().details['desc'] != null ? const SizedBox(height: 10,) : const SizedBox.shrink(),
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
                        context.watch<DetailScreenProvider>().details['location'] != null ? Row(
                          children: [
                            const SizedBox(width: 10,),
                            const Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              child: TextButton(
                                style: const ButtonStyle(
                                  alignment: Alignment.centerLeft
                                ),
                                onPressed: () {  },
                                child: Text(
                                  context.watch<DetailScreenProvider>().details['location'].toString(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    decoration: TextDecoration.underline
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 30,),
                          ],
                        ) : const SizedBox.shrink(),
                        context.watch<DetailScreenProvider>().details['location'] != null ? const SizedBox(height: 10,) : const SizedBox.shrink(),
                        context.watch<DetailScreenProvider>().details['contact'] != null ? Row(
                          children: [
                            const SizedBox(width: 10,),
                            const Icon(
                              Icons.phone,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              child: TextButton(
                                style: const ButtonStyle(
                                    alignment: Alignment.centerLeft
                                ),
                                onPressed: () {
                                  launchUrl(Uri(scheme: 'tel', path: Provider.of<DetailScreenProvider>(context, listen: false).details['contact'].toString()));
                                },
                                child: Text(
                                  context.watch<DetailScreenProvider>().details['contact'].toString(),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 30,),
                          ],
                        ) : const SizedBox.shrink(),
                        context.watch<DetailScreenProvider>().details['contact'] != null ? const SizedBox(height: 10,) : const SizedBox.shrink(),
                        context.watch<DetailScreenProvider>().details['website'] != null ? Row(
                          children: [
                            const SizedBox(width: 10,),
                            const Icon(
                              Icons.cloud_circle_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              child: TextButton(
                                style: const ButtonStyle(
                                    alignment: Alignment.centerLeft
                                ),
                                onPressed: () {
                                  launchUrl(Uri.parse(Provider.of<DetailScreenProvider>(context, listen: false).details['website'].toString()));
                                },
                                child: Text(
                                  context.watch<DetailScreenProvider>().details['website'].toString(),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 30,),
                          ],
                        ) : const SizedBox.shrink(),
                        context.watch<DetailScreenProvider>().details['website'] != null ? const SizedBox(height: 10,) : const SizedBox.shrink(),
                        context.watch<DetailScreenProvider>().details['email'] != null ? Row(
                          children: [
                            const SizedBox(width: 10,),
                            const Icon(
                              Icons.email,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              child: TextButton(
                                style: const ButtonStyle(
                                    alignment: Alignment.centerLeft
                                ),
                                onPressed: () {
                                  launchUrl(Uri(scheme: 'mailto', path: Provider.of<DetailScreenProvider>(context, listen: false).details['email'].toString()));
                                },
                                child: Text(
                                  context.watch<DetailScreenProvider>().details['email'].toString(),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 30,),
                          ],
                        ) : const SizedBox.shrink(),
                        context.watch<DetailScreenProvider>().details['email'] != null ? const SizedBox(height: 10,) : const SizedBox.shrink(),
                        context.watch<DetailScreenProvider>().details['twitter'] != null ? Row(
                          children: [
                            const SizedBox(width: 10,),
                            const Icon(
                              Icons.account_circle_sharp,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              child: TextButton(
                                style: const ButtonStyle(
                                    alignment: Alignment.centerLeft
                                ),
                                onPressed: () {

                                },
                                child: Text(
                                  context.watch<DetailScreenProvider>().details['twitter'].toString(),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 30,),
                          ],
                        ) : const SizedBox.shrink(),
                        context.watch<DetailScreenProvider>().details['twitter'] != null ? const SizedBox(height: 10,) : const SizedBox.shrink(),
                        const Expanded(child: SizedBox.shrink()),
                        name == "Mamo" || name == "Zafran Indian Bistro" ? Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/reservationScreen');
                            },
                            style: const ButtonStyle(
                              padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                              backgroundColor: MaterialStatePropertyAll(Color(0xFF6F7C42))
                            ),
                            child: const Text(
                              "Reserve",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ) : const SizedBox.shrink(),
                        const SizedBox(height: 30,),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
          else {
            return const Center(child: CircularProgressIndicator(color: Colors.grey,));
          }
        },
      ),
    );
  }
}
