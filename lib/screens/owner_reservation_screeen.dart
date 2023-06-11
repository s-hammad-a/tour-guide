import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:togu/controllers/booking_controller.dart';
import 'package:togu/modules/BookingDetails.dart';

class OwnerReservationScreen extends StatelessWidget {
  const OwnerReservationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    if(args == null) {
      Navigator.pop(context);
    }
    String name = args['name'].toString();
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
        future: Provider.of<BookingProvider>(context, listen: false).getRestaurantBookings(name),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
                const Text(
                  "Booking Details",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 10,),
                Expanded(
                  child: ListView.builder(
                    itemCount: context.watch<BookingProvider>().bookings.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        child: BookingCard(details: context.watch<BookingProvider>().bookings[index], name: name,),
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

class BookingCard extends StatelessWidget {
  const BookingCard({Key? key, required this.details, required this.name}) : super(key: key);
  final BookingDetails details;
  final String name;
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
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      child: SizedBox(
        height: 200,
        child: Row(
          children: [
            Expanded(
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
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
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      details.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      details.time,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      weekdays[details.date.weekday],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      details.date.toString().substring(0, 10),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      details.phone,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 5,),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 40,
              child: IconButton(
                onPressed: () {
                  Provider.of<BookingProvider>(context, listen: false).deleteRestaurantBooking(details.id, name);
                },
                icon: const Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                  size: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
