import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:togu/controllers/tourism_screen_controller.dart';

class TourismDetailScreen extends StatelessWidget {
  const TourismDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    if (args == null) {
      Navigator.pop(context);
    }
    int index = args['index'];
    return Scaffold(
      backgroundColor: const Color(0xAA8496A2),
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
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        margin: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: context.watch<TourismScreenProvider>().details[index].values.map((value) {
            return value;
          }).toList().length - 2,
          itemBuilder: (BuildContext context, int index2) {
            return Card(
              color: const Color(0xFFDCE3D3),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
                  child: Text(
                    context.watch<TourismScreenProvider>().details[index][index2.toString()],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            );
          },
        )
      )
    );
  }
}
