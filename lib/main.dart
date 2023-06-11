import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:togu/controllers/booking_controller.dart';
import 'package:togu/controllers/create_account_controller.dart';
import 'package:togu/controllers/detail_screen_controller.dart';
import 'package:togu/controllers/edit_screen_controller.dart';
import 'package:togu/controllers/home_screen_controller.dart';
import 'package:togu/controllers/log_in_controller.dart';
import 'package:togu/controllers/profile_screen_controller.dart';
import 'package:togu/controllers/reservation_controller.dart';
import 'package:togu/controllers/saved_screen_controller.dart';
import 'package:togu/controllers/tourism_screen_controller.dart';
import 'package:togu/firebase/firebase_auth.dart';
import 'package:togu/screens/add_tourism_screen.dart';
import 'package:togu/screens/booking_screen.dart';
import 'package:togu/screens/buses_screen.dart';
import 'package:togu/screens/car_rental_screen.dart';
import 'package:togu/screens/city_screen.dart';
import 'package:togu/screens/create_account_screen.dart';
import 'package:togu/screens/details_screen.dart';
import 'package:togu/screens/edit_screen.dart';
import 'package:togu/screens/home_screen.dart';
import 'package:togu/screens/log_in_screen.dart';
import 'package:togu/screens/other_screen.dart';
import 'package:togu/screens/owner_reservation_screeen.dart';
import 'package:togu/screens/reservation_screen.dart';
import 'package:togu/screens/restaurant_screen.dart';
import 'package:togu/screens/reviews_screen.dart';
import 'package:togu/screens/saved_screen.dart';
import 'package:togu/screens/splash_page.dart';
import 'package:togu/screens/taxi_screen.dart';
import 'package:togu/screens/tourism_details_screen.dart';
import 'package:togu/screens/tourism_screen.dart';
import 'package:togu/screens/transport_screen.dart';
import 'package:togu/screens/travel_plan_screen.dart';
import 'package:togu/screens/welcome_screen.dart';
import 'package:togu/wrapper.dart';

void main() {
  runApp(const MyApp());
}

Future<String> initializeFirebase() async {
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCBPrhO92KCGJWuTR-DnM-Felx7YOu3yRQ",
          authDomain: "togu-b76f2.firebaseapp.com",
          projectId: "togu-b76f2",
          storageBucket: "togu-b76f2.appspot.com",
          messagingSenderId: "851169553338",
          appId: "1:851169553338:web:a64725a26e8cd9cfcbcb83",
          measurementId: "G-DM1G51FR76",
          databaseURL: "https://togu-b76f2-default-rtdb.firebaseio.com"
      )
  );
  // }
  await Future.delayed(const Duration(seconds: 2));
  return "done";
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeScreenProvider()),
        ChangeNotifierProvider(create: (_) => DetailScreenProvider()),
        ChangeNotifierProvider(create: (_) => CreateAccountProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => ReservationProvider()),
        ChangeNotifierProvider(create: (_) => BookingProvider()),
        ChangeNotifierProvider(create: (_) => SavedScreenProvider()),
        ChangeNotifierProvider(create: (_) => ProfileScreenProvider()),
        ChangeNotifierProvider(create: (_) => EditScreenProvider()),
        ChangeNotifierProvider(create: (_) => TourismScreenProvider()),
      ],
      child: FutureBuilder(
        future: initializeFirebase(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamProvider.value(
              value: AuthService().user,
              initialData: null,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'TOGU',
                routes: {
                  "/wrapper": (context) => const Wrapper(),
                  "/welcomeScreen": (context) => const WelcomePage(),
                  "/loginScreen": (context) => const LoginScreen(),
                  "/signupScreen": (context) => const CreateAccountScreen(),
                  "/homeScreen": (context) => const HomeScreen(),
                  "/transportScreen": (context) => const TransportScreen(),
                  "/restaurantScreen": (context) => const RestaurantScreen(),
                  "/travelScreen": (context) => const TravelPlanScreen(),
                  "/otherScreen": (context) => const OtherScreen(),
                  "/busesScreen": (context) => const BusesScreen(),
                  "/taxiScreen": (context) => const TaxiScreen(),
                  "/carRentalScreen": (context) => const CarRentalScreen(),
                  "/detailScreen": (context) => const DetailScreen(),
                  "/tourismScreen": (context) => const TourismScreen(),
                  "/reservationScreen": (context) => const ReservationScreen(),
                  "/bookingScreen": (context) => const BookingScreen(),
                  "/savedScreen": (context) => const SavedScreen(),
                  "/reviewsScreen": (context) => const ReviewsScreen(),
                  "/cityScreen": (context) => const CityScreen(),
                  "/editScreen": (context) => const EditScreen(),
                  "/ownerReservationScreen": (context) => const OwnerReservationScreen(),
                  "/tourismDetailScreen": (context) => const TourismDetailScreen(),
                  "/addTourismScreen": (context) => const AddTourismScreen(),
                },
                theme: ThemeData(
                  // This is the theme of your application.
                  //
                  // TRY THIS: Try running your application with "flutter run". You'll see
                  // the application has a blue toolbar. Then, without quitting the app,
                  // try changing the seedColor in the colorScheme below to Colors.green
                  // and then invoke "hot reload" (save your changes or press the "hot
                  // reload" button in a Flutter-supported IDE, or press "r" if you used
                  // the command line to start the app).
                  //
                  // Notice that the counter didn't reset back to zero; the application
                  // state is not lost during the reload. To reset the state, use hot
                  // restart instead.
                  //
                  // This works for code too, not just values: Most code changes can be
                  // tested with just a hot reload.
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                home: const WelcomePage(),
              ),
            );
          } else {
            return const MaterialApp(home: SplashPage()
                // home: ReservationScreen()
            );
          }
        },
      ),
    );
  }
}
