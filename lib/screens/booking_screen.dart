import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:togu/controllers/booking_controller.dart';
import 'package:togu/modules/BookingDetails.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCE3D3),
      body: FutureBuilder(
        future: Provider.of<BookingProvider>(context, listen: false).getBookings(),
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
                        child: BookingCard(details: context.watch<BookingProvider>().bookings[index]),
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
  const BookingCard({Key? key, required this.details}) : super(key: key);
  final BookingDetails details;
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
                    image: AssetImage(details.restaurant == "Mamo" ? "assets/mamo.webp" : details.restaurant == "Zafran Indian Bistro" ? "assets/resterent.jpg" : "assets/travel_plans.jpg"),
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
                      details.restaurant,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 5,),
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
            )
          ],
        ),
      ),
    );
  }
}
