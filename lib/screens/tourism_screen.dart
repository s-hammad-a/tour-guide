import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:togu/controllers/tourism_screen_controller.dart';

import '../controllers/home_screen_controller.dart';

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
                        const SizedBox(width: 10,),
                        Provider.of<HomeScreenProvider>(context, listen: false).isAdmin ? IconButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Colors.white)
                          ),
                          icon: const Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 20,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, "/addTourismScreen");
                          },
                        ) : const SizedBox.shrink(),
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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              color: const Color(0xAA8496A2),
              child: FutureBuilder(
                future: Provider.of<TourismScreenProvider>(context, listen: false).getDetails(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if(snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: context.watch<TourismScreenProvider>().details.length,
                      itemBuilder: (BuildContext context, int index) {
                        return DetailCard(index: index);
                      },
                    );
                  }
                  else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          )
        ],
      )
    );
  }
}

class DetailCard extends StatelessWidget {
  const DetailCard({Key? key, required this.index}) : super(key: key);
  final int index;
  final List<String> weekdays = const [
    "",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        onLongPress: () {
          if(Provider.of<HomeScreenProvider>(context, listen: false).isAdmin) {
            Provider.of<TourismScreenProvider>(context, listen: false).deletePlan(index);
          }
        },
        onTap: () {
          Navigator.pushNamed(context, "/tourismDetailScreen", arguments: {
            "index" : index
          });
        },
        title: Column(
          children: [
            Text(
              context.watch<TourismScreenProvider>().details[index]['date'].toString().substring(0,10),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10,),
            Text(
              weekdays[DateTime.parse(context.watch<TourismScreenProvider>().details[index]['date']).weekday],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
