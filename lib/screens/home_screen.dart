import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:togu/controllers/home_screen_controller.dart';
import 'package:togu/firebase/firebase_auth.dart';
import 'package:togu/screens/booking_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCE3D3),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8F967A),
        title: Row(
          children: [
            const SizedBox(width: 10,),
            Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset("assets/sample.png", height: 50, width: 50, fit: BoxFit.fill,)
            ),
            const SizedBox(width: 10,),
            Text(
              "Welcome ${AuthService().auth.currentUser!.displayName}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Provider.of<HomeScreenProvider>(context, listen: false).currentIndex == 0 ? const BookmarkPage() : Provider.of<HomeScreenProvider>(context, listen: false).currentIndex == 1 ? const HomePage() : Provider.of<HomeScreenProvider>(context, listen: false).currentIndex == 2 ? const BookingScreen(): const ProfilePage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0x888496A2),
        currentIndex: context.watch<HomeScreenProvider>().currentIndex,
        onTap: (value) {
          Provider.of<HomeScreenProvider>(context, listen: false).setCurrentIndex(value);
        },
        items: const [
          BottomNavigationBarItem(
            label: "Bookmarks",
            activeIcon: Icon(
              Icons.bookmark,
              color: Colors.blue,
              size: 30,
            ),
            icon: Icon(
              Icons.bookmark,
              color: Colors.white,
              size: 20,
            ),
          ),
          BottomNavigationBarItem(
            label: "Home",
            activeIcon: Icon(
              Icons.home_filled,
              color: Colors.blue,
              size: 30,
            ),
            icon: Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: "Bookings",
            activeIcon: Icon(
              Icons.calendar_month,
              color: Colors.blue,
              size: 30,
            ),
            icon: Icon(
              Icons.calendar_month,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            activeIcon: Icon(
              Icons.person,
              color: Colors.blue,
              size: 30,
            ),
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   color: const Color(0xFF8F967A),
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: 10, bottom: 10),
        //     child: Row(
        //       children: [
        //         const SizedBox(width: 30,),
        //         Container(
        //           clipBehavior: Clip.hardEdge,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(20),
        //           ),
        //           child: Image.asset("assets/sample.png", height: 50, width: 50, fit: BoxFit.fill,)
        //         ),
        //         const SizedBox(width: 10,),
        //         const Text(
        //           "Welcome Asma",
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 20
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        const SizedBox(height: 30,),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/transportScreen');
              },
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(image: AssetImage("assets/transport.jpg"), fit: BoxFit.fitWidth)
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Transport",
                  style: TextStyle(
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
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/restaurantScreen');
              },
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(image: AssetImage("assets/cafe.jpg"), fit: BoxFit.fitWidth)
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Restaurants & Cafe",
                  style: TextStyle(
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
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/travelScreen');
              },
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(image: AssetImage("assets/travel.jpg"), fit: BoxFit.fitWidth)
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Travel Plans",
                  style: TextStyle(
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
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/otherScreen');
              },
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(image: AssetImage("assets/others.jpg"), fit: BoxFit.fitWidth)
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Others",
                  style: TextStyle(
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
            ),
          ),
        ),
        const SizedBox(height: 30,),
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        //   child: Row(
        //     children: [
        //       Expanded(
        //         child: SizedBox(
        //           height: 50,
        //           child: TextFormField(
        //             style: const TextStyle(
        //               fontSize: 15,
        //               color: Color(0xFF8496A2)
        //             ),
        //             cursorColor: const Color(0xFF8496A2),
        //             decoration: const InputDecoration(
        //               filled: true,
        //               fillColor: Color(0x55A5AA94),
        //               hintText: "Search here...",
        //               hintStyle: TextStyle(
        //                 fontSize: 15,
        //                 color: Color(0xFF8496A2)
        //               ),
        //               border: OutlineInputBorder(
        //                 borderSide: BorderSide(color: Colors.transparent),
        //                 borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
        //               ),
        //               focusedBorder: OutlineInputBorder(
        //                   borderSide: BorderSide(color: Colors.transparent),
        //                   borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
        //               ),
        //               enabledBorder: OutlineInputBorder(
        //                   borderSide: BorderSide(color: Colors.transparent),
        //                   borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //         height: 50,
        //         width: 50,
        //         child: IconButton(
        //           style: const ButtonStyle(
        //             backgroundColor: MaterialStatePropertyAll(Color(0xFF8F967A)),
        //             shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)))),
        //           ),
        //           onPressed: () {  },
        //           icon: const Icon(
        //             Icons.search,
        //             color: Colors.white,
        //             size: 25,
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

