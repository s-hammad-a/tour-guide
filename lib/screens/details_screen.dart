import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:togu/controllers/detail_screen_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/edit_screen_controller.dart';
import '../controllers/home_screen_controller.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    if (args == null) {
      Navigator.pop(context);
    }
    String name = args['name'].toString();
    User? user = Provider.of<User?>(context);
    if(user == null) {
      Navigator.pop(context);
    }
    if(user!.email!.contains("@togu.com")) {
      Provider.of<HomeScreenProvider>(context, listen: false).isAdmin = true;
    }
    else {
      Provider.of<HomeScreenProvider>(context, listen: false).isAdmin = false;
    }
    Provider.of<DetailScreenProvider>(context, listen: false).name = name;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFDCE3D3),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Smart Tour Guide",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: const Color(0xFF8F967A),
      ),
      body: FutureBuilder(
        future: Provider.of<DetailScreenProvider>(context, listen: false).getFromDatabase(name),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Image.asset(
                        name == "Mamo"
                            ? "assets/mamo.webp"
                            : name == "Zafran Indian Bistro"
                                ? "assets/resterent.jpg"
                                : name == "Riyadh Bus"
                                    ? "assets/bus.jpg"
                                    : name == "Taxi Terminal"
                                        ? "assets/Riyadh-taxi.webp"
                                        : name == "YELO"
                                            ? "assets/yelo.jpeg"
                                            : name == "Boulevard World"
                                                ? "assets/Gltlnipw-boulevard.jpg"
                                                : name == "National Museum of Saudi Arabia"
                                                    ? "assets/Saa.webp"
                                                    : name == "Hilton Riyadh"
                                                      ? "assets/hiltonRiyadh.png"
                                                      : name == "SAPTCO"
                                                        ? "assets/bussaptco.jpg"
                                                        : name == "Go Taxi"
                                                          ? "assets/gotaxi.webp"
                                                          : name == "Yahma Company"
                                                            ? "assets/YahmaCompany.jpg"
                                                            : name == "Wasm Company"
                                                              ? "assets/wasm.jpg"
                                                              : name == "Al-Bujairi View"
                                                                ? "assets/AlBujairview.jpg"
                                                                : name == "Last Hour"
                                                                  ? "assets/LastHour.jpg"
                                                                  : name == "Cipriani"
                                                                    ? "assets/Cipriani.jpg"
                                                                    : name == "IL baretto"
                                                                      ? "assets/ILbaretto.jpg"
                                                                      : "assets/travel_plans.jpg",
                        width: size.width,
                        fit: BoxFit.fill,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Provider.of<HomeScreenProvider>(context, listen: false).isAdmin ? IconButton(
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(Colors.white)),
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                onPressed: () async {
                                  Provider.of<EditScreenProvider>(context, listen: false).contactController.text = Provider.of<DetailScreenProvider>(context, listen: false).details['contact'].toString();
                                  Provider.of<EditScreenProvider>(context, listen: false).emailController.text = Provider.of<DetailScreenProvider>(context, listen: false).details['email'].toString();
                                  Provider.of<EditScreenProvider>(context, listen: false).websiteController.text = Provider.of<DetailScreenProvider>(context, listen: false).details['website'].toString();
                                  Provider.of<EditScreenProvider>(context, listen: false).descController.text = Provider.of<DetailScreenProvider>(context, listen: false).details['desc'].toString();
                                  Provider.of<EditScreenProvider>(context, listen: false).socialController.text = Provider.of<DetailScreenProvider>(context, listen: false).details['twitter'].toString();
                                  Provider.of<EditScreenProvider>(context, listen: false).locationController.text = Provider.of<DetailScreenProvider>(context, listen: false).details['location'].toString();
                                  Navigator.pushNamed(context, "/editScreen", arguments: {
                                    "name" : name
                                  }).whenComplete(() => Provider.of<DetailScreenProvider>(context, listen: false).getFromDatabase(name));
                                },
                              ) : const SizedBox.shrink(),
                              const Expanded(child: SizedBox.shrink()),
                              IconButton(
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(Colors.white)),
                                icon: context.watch<DetailScreenProvider>().isSaved ? const Icon(
                                  Icons.bookmark_added_outlined,
                                  color: Colors.blue,
                                  size: 20,
                                ) : const Icon(
                                  Icons.bookmark_add_outlined,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                onPressed: () {
                                  Provider.of<DetailScreenProvider>(context, listen: false).savePlace(name);
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
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
                                  Shadow(
                                      // bottomLeft
                                      offset: Offset(-1.5, -1.5),
                                      color: Colors.black),
                                  Shadow(
                                      // bottomRight
                                      offset: Offset(1.5, -1.5),
                                      color: Colors.black),
                                  Shadow(
                                      // topRight
                                      offset: Offset(1.5, 1.5),
                                      color: Colors.black),
                                  Shadow(
                                      // topLeft
                                      offset: Offset(-1.5, 1.5),
                                      color: Colors.black),
                                ]
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
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
                        const SizedBox(
                          height: 20,
                        ),
                        context.watch<DetailScreenProvider>().details['desc'] != "" ? const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ) : const SizedBox.shrink(),
                        context.watch<DetailScreenProvider>().details['desc'] != "" ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.description,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                context.watch<DetailScreenProvider>().details['desc'].toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                          ],
                        ) : const SizedBox.shrink(),
                        context.watch<DetailScreenProvider>().details['desc'] != "" ? const SizedBox(
                          height: 10,
                        ) : const SizedBox.shrink(),
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Location And Contact",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        context.watch<DetailScreenProvider>().details['location'] != "" ? Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextButton(
                                style: const ButtonStyle(alignment: Alignment.centerLeft),
                                onPressed: () {},
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
                            const SizedBox(
                              width: 30,
                            ),
                          ],
                        ) : const SizedBox.shrink(),
                        context.watch<DetailScreenProvider>().details['location'] != "" ? const SizedBox(
                          height: 10,
                        ) : const SizedBox.shrink(),
                        context.watch<DetailScreenProvider>().details['contact'] != "" ? Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.phone,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextButton(
                                style: const ButtonStyle(alignment: Alignment.centerLeft),
                                onPressed: () {
                                  launchUrl(
                                    Uri(
                                      scheme: 'tel',
                                      path: Provider.of<DetailScreenProvider>(context, listen: false).details['contact'].toString()
                                    )
                                  );
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
                            const SizedBox(
                              width: 30,
                            ),
                          ],
                        ) : const SizedBox.shrink(),
                        context.watch<DetailScreenProvider>().details['contact'] != "" ? const SizedBox(
                          height: 10,
                        ) : const SizedBox.shrink(),
                        context.watch<DetailScreenProvider>().details['website'] != "" ? Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.cloud_circle_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextButton(
                                style: const ButtonStyle(alignment: Alignment.centerLeft),
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
                            const SizedBox(
                              width: 30,
                            ),
                          ],
                        ) : const SizedBox.shrink(),
                        context.watch<DetailScreenProvider>().details['website'] != "" ? const SizedBox(
                          height: 10,
                        ) : const SizedBox.shrink(),
                        context.watch<DetailScreenProvider>().details['email'] != "" ? Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.email,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextButton(
                                style: const ButtonStyle(
                                    alignment: Alignment.centerLeft),
                                onPressed: () {
                                  launchUrl(
                                    Uri(
                                      scheme: 'mailto',
                                      path: Provider.of<DetailScreenProvider>(context, listen: false).details['email'].toString()
                                    )
                                  );
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
                            const SizedBox(
                              width: 30,
                            ),
                          ],
                        ) : const SizedBox.shrink(),
                        context.watch<DetailScreenProvider>().details['email'] != "" ? const SizedBox(
                          height: 10,
                        ) : const SizedBox.shrink(),
                        context.watch<DetailScreenProvider>().details['twitter'] != "" ? Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.account_circle_sharp,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextButton(
                                style: const ButtonStyle(
                                  alignment: Alignment.centerLeft),
                                onPressed: () {},
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
                            const SizedBox(
                              width: 30,
                            ),
                          ],
                        ) : const SizedBox.shrink(),
                        context.watch<DetailScreenProvider>().details['twitter'] != "" ? const SizedBox(
                          height: 10,
                        ) : const SizedBox.shrink(),
                        const Expanded(child: SizedBox.shrink()),
                        name == "Mamo" || name == "Zafran Indian Bistro" || name == "Cipriani" || name == "IL baretto" ? Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/reservationScreen', arguments: {"name": name});
                            },
                            style: const ButtonStyle(
                              padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                              backgroundColor: MaterialStatePropertyAll(Color(0xFF6F7C42))),
                            child: const Text(
                              "Reserve",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ) : const SizedBox.shrink(),
                        const SizedBox(
                          height: 5,
                        ),
                        const Reviews(),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.grey,
            ));
          }
        },
      ),
    );
  }
}


class Reviews extends StatelessWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<DetailScreenProvider>(context, listen: false).getAllReviews(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          return Padding(
            padding: const EdgeInsets.only(
                left: 20, right: 20, top: 0, bottom: 15),
            child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 212, 211, 211),
                ),
                padding: const EdgeInsets.all(10),
                // alignment: Alignment.center,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding:
                          EdgeInsets.only(top: 10, left: 10),
                          child: Icon(
                            Icons.comment_outlined,
                            color: Colors.white,
                          ),
                        ),
                        const Padding(
                          padding:
                          EdgeInsets.only(left: 8.0, top: 0),
                          child: Text(
                            "Review",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        const Expanded(child: SizedBox.shrink()),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            borderRadius:
                            BorderRadius.circular(20),
                          ),
                          child: TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder:
                                      (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                          'Write a review'),
                                      content: TextFormField(
                                        controller: context.watch<DetailScreenProvider>().review,
                                        cursorColor:
                                        Colors.black,
                                        textInputAction:
                                        TextInputAction
                                            .done,
                                        decoration:
                                        const InputDecoration(
                                          hintText:
                                          'Write a review',
                                        ),
                                      ),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          style: ElevatedButton
                                              .styleFrom(
                                              backgroundColor:
                                              Colors.grey[
                                              600]),
                                          child: const Text(
                                              style: TextStyle(
                                                  color: Colors
                                                      .white),
                                              'Enter'),
                                          onPressed: () {
                                            Provider.of<DetailScreenProvider>(context, listen: false).addReviews().whenComplete(() => Navigator.pop(context)) ;

                                          },
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton
                                              .styleFrom(
                                              backgroundColor:
                                              Colors.grey[
                                              600]),
                                          child: const Text(
                                              style: TextStyle(
                                                  color: Colors
                                                      .white),
                                              'Cancel'),
                                          onPressed: () {
                                            Navigator.of(
                                                context)
                                                .pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const Text(
                                'Write a Review',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight:
                                    FontWeight.normal,
                                    color: Colors.white),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, left: 3, right: 3),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[600],
                              borderRadius:
                              BorderRadius.circular(20),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  print("before ");
                                  Navigator.pushNamed(
                                      context, '/reviewsScreen');

                                  print("after");
                                },
                                child: const Text(
                                  'View All',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight:
                                      FontWeight.normal,
                                      color: Colors.white),
                                )),
                          ),
                        ),
                      ],
                    ),
                    context.watch<DetailScreenProvider>().reviews.isNotEmpty ? const Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        color: Colors.black,
                        thickness: 0.5,
                      ),
                    ) : const SizedBox.shrink(),
                    context.watch<DetailScreenProvider>().reviews.isNotEmpty ? Padding(
                      padding: const EdgeInsets.only(
                          top: 5, left: 10, right: 10),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.person,
                                color: Colors.white),
                          ),
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  context.watch<DetailScreenProvider>().reviews[0]['name'],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  context.watch<DetailScreenProvider>().reviews[0]['review'],
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight:
                                      FontWeight.normal,
                                      color: Colors.black),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ) : const SizedBox.shrink(),
                  ],
                )),
          );
        }
        else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

