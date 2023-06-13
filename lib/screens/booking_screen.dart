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
                    itemCount: context.watch<BookingProvider>().bookings.length + context.watch<BookingProvider>().tourismBookings.length,
                    itemBuilder: (BuildContext context, int index) {
                      if(Provider.of<BookingProvider>(context, listen: false).bookings.length > index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                          child: BookingCard(details: context.watch<BookingProvider>().bookings[index]),
                        );
                      }
                      else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                          child: TourismCard(index: index - Provider.of<BookingProvider>(context, listen: false).bookings.length),
                        );
                      }
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
                    image: AssetImage(details.restaurant == "Mamo"
                        ? "assets/mamo.webp"
                        : details.restaurant == "Zafran Indian Bistro"
                        ? "assets/resterent.jpg"
                        : details.restaurant == "Riyadh Bus"
                        ? "assets/bus.jpg"
                        : details.restaurant == "Taxi Terminal"
                        ? "assets/Riyadh-taxi.webp"
                        : details.restaurant == "YELO"
                        ? "assets/yelo.jpeg"
                        : details.restaurant == "Boulevard World"
                        ? "assets/Gltlnipw-boulevard.jpg"
                        : details.restaurant == "National Museum of Saudi Arabia"
                        ? "assets/Saa.webp"
                        : details.restaurant == "Hilton Riyadh"
                        ? "assets/hiltonRiyadh.png"
                        : details.restaurant == "SAPTCO"
                        ? "assets/bussaptco.jpg"
                        : details.restaurant == "Go Taxi"
                        ? "assets/gotaxi.webp"
                        : details.restaurant == "Yahma Company"
                        ? "assets/YahmaCompany.jpg"
                        : details.restaurant == "Wasm Company"
                        ? "assets/wasm.jpg"
                        : details.restaurant == "Al-Bujairi View"
                        ? "assets/AlBujairview.jpg"
                        : details.restaurant == "Last Hour"
                        ? "assets/LastHour.jpg"
                        : details.restaurant == "Cipriani"
                        ? "assets/Cipriani.jpg"
                        : details.restaurant == "IL baretto"
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
            ),
            SizedBox(
              width: 40,
              child: IconButton(
                onPressed: () {
                  Provider.of<BookingProvider>(context, listen: false).deleteBooking(details.id);
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


class TourismCard extends StatelessWidget {
  const TourismCard({Key? key, required this.index}) : super(key: key);
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
    DateTime dateTime = DateTime.parse(context.watch<BookingProvider>().tourismBookings[index]['date'],);
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
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage("assets/travel_plans.jpg",),
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
                      context.watch<BookingProvider>().tourismBookings[index]['name'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      context.watch<BookingProvider>().tourismBookings[index]['email'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      weekdays[dateTime.weekday],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      dateTime.toString().substring(0, 10),
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
                  Provider.of<BookingProvider>(context, listen: false).deleteBooking(Provider.of<BookingProvider>(context, listen: false).tourismBookings[index]['ids']);
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
