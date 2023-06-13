import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:togu/controllers/tourism_screen_controller.dart';

class TourismReservationScreen extends StatelessWidget {
  const TourismReservationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    if(args == null) {
      Navigator.pop(context);
    }
    String id = args['id'].toString();
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            const Text(
              "Reserve A Table",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30,),
            const Text(
              "Personal Details",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 40,
              child: TextFormField(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[ a-zA-Z]")),
                ],
                keyboardType: TextInputType.text,
                controller: context.watch<TourismScreenProvider>().nameController,
                decoration: const InputDecoration(
                  hintText: "Name",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 40,
              child: TextFormField(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                keyboardType: TextInputType.emailAddress,
                controller: context.watch<TourismScreenProvider>().emailController,
                decoration: const InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const Expanded(child: SizedBox.shrink()),
            SizedBox(
              height: 50,
              child: TextButton(
                onPressed: () {
                  Provider.of<TourismScreenProvider>(context, listen: false).addReservation(id).then((value) async {
                    if(value) {
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: const Color(0xFFBFB6AA),
                            shape: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF545454), width: 1.0),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            titlePadding: EdgeInsets.zero,
                            title: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFF8F967A),
                                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                              ),
                              padding: const EdgeInsets.only(left: 20),
                              height: 40,
                              child: const Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Text(
                                    'Success',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            content: const SizedBox(
                              width: 300,
                              child: Text(
                                "Booking confirmed",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(Color(0xFF8F967A))
                                ),
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Okay',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ).whenComplete(() => Navigator.pop(context));
                    }
                  });
                },
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                    backgroundColor: MaterialStatePropertyAll(Color(0xFF6F7C42))
                ),
                child: const Text(
                  "Confirm Reservation",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
