import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:togu/controllers/saved_screen_controller.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCE3D3),
      body: FutureBuilder(
        future: Provider.of<SavedScreenProvider>(context, listen: false).getPlaces(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
                const Text(
                  "Saved Places",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 10,),
                Expanded(
                  child: ListView.builder(
                    itemCount: context.watch<SavedScreenProvider>().places.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        child: PlaceCard(name: context.watch<SavedScreenProvider>().places[index]),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          else {
            return const Center(child: CircularProgressIndicator(color: Colors.grey,),);
          }
        },

      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  const PlaceCard({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detailScreen', arguments: {
          "name" : name,
        });
      },
      child: Container(
        height: 150,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage(name == "Mamo"
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
                    : "assets/travel_plans.jpg",),
                fit: BoxFit.fill
            ),
        ),
        alignment: Alignment.center,
        child: Text(
          name,
          style: const TextStyle(
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
    );
  }
}