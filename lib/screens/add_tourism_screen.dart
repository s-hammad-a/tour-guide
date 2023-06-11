import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:togu/controllers/tourism_screen_controller.dart';

class AddTourismScreen extends StatelessWidget {
  const AddTourismScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              "Add Tourism Plan",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: () async {
                Provider.of<TourismScreenProvider>(context, listen: false).updateDate((await showDatePicker(
                  context: context,
                  initialDate: DateTime.now().add(const Duration(days: 1)),
                  firstDate: DateTime.now().add(const Duration(days: 1)),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                ))!);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: Card(
                  color: const Color(0xAABFB6AA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text(
                          "Select Date",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        const Expanded(child: SizedBox.shrink()),
                        Text(
                          context.watch<TourismScreenProvider>().date.toString().substring(0, 10),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
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
                keyboardType: TextInputType.text,
                controller: context.watch<TourismScreenProvider>().placeControllers[0],
                decoration: const InputDecoration(
                  hintText: "Add Plan 1",
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
                keyboardType: TextInputType.text,
                controller: context.watch<TourismScreenProvider>().placeControllers[1],
                decoration: const InputDecoration(
                  hintText: "Add Plan 2",
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
                keyboardType: TextInputType.text,
                controller: context.watch<TourismScreenProvider>().placeControllers[2],
                decoration: const InputDecoration(
                  hintText: "Add Plan 3",
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
                keyboardType: TextInputType.text,
                controller: context.watch<TourismScreenProvider>().placeControllers[3],
                decoration: const InputDecoration(
                  hintText: "Add Plan 4",
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
                keyboardType: TextInputType.text,
                controller: context.watch<TourismScreenProvider>().placeControllers[4],
                decoration: const InputDecoration(
                  hintText: "Add Plan 5",
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
                keyboardType: TextInputType.text,
                controller: context.watch<TourismScreenProvider>().placeControllers[5],
                decoration: const InputDecoration(
                  hintText: "Add Plan 6",
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
                keyboardType: TextInputType.text,
                controller: context.watch<TourismScreenProvider>().placeControllers[6],
                decoration: const InputDecoration(
                  hintText: "Add Plan 7 ",
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
                  Provider.of<TourismScreenProvider>(context, listen: false).addPlans().whenComplete(() => Navigator.pop(context));
                },
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                    backgroundColor: MaterialStatePropertyAll(Color(0xFF6F7C42))
                ),
                child: const Text(
                  "Add All Plan",
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
