import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:togu/controllers/detail_screen_controller.dart';
import 'package:togu/controllers/home_screen_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCE3D3),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Reviews",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: const Color(0xFF8F967A),
      ),
      body: FutureBuilder(
        future: Provider.of<DetailScreenProvider>(context, listen: false).getAllReviews(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return Container(
              color: const Color(0xAA8496A2),
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                scrollDirection: Axis.vertical,
                itemCount: context.watch<DetailScreenProvider>().reviews.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    context.watch<DetailScreenProvider>().reviews[index]['name'],
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    context.watch<DetailScreenProvider>().reviews[index]['review'],
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                            context.watch<HomeScreenProvider>().isAdmin ? const Expanded(child: SizedBox.shrink()) : const SizedBox.shrink(),
                            context.watch<HomeScreenProvider>().isAdmin ? IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.black,
                                size: 20,
                              ),
                              padding: EdgeInsets.zero,
                              splashRadius: 40,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: const Color(0x998F967A),
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
                                            Icon(
                                              Icons.warning_amber,
                                              size: 20,
                                              color: Colors.red,
                                            ),
                                            SizedBox(width: 10,),
                                            Text(
                                              'Warning',
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
                                          'Do you want to permanently delete this review?',
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
                                            await Provider.of<DetailScreenProvider>(context, listen: false).deleteReviews(Provider.of<DetailScreenProvider>(context, listen: false).reviews[index]['id'].toString());
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'Confirm',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: const ButtonStyle(
                                              backgroundColor: MaterialStatePropertyAll(Color(0xFF8F967A))
                                          ),
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'Cancel',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ) : const SizedBox.shrink(),
                            const SizedBox(width: 10,),
                          ],
                        ),
                      ));
                },
              ),
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
