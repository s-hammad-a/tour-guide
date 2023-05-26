import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:togu/controllers/home_screen_controller.dart';
import 'package:togu/screens/buses_screen.dart';
import 'package:togu/screens/car_rental_screen.dart';
import 'package:togu/screens/create_account_screen.dart';
import 'package:togu/screens/details_screen.dart';
import 'package:togu/screens/home_screen.dart';
import 'package:togu/screens/log_in_screen.dart';
import 'package:togu/screens/other_screen.dart';
import 'package:togu/screens/restaurant_screen.dart';
import 'package:togu/screens/splash_page.dart';
import 'package:togu/screens/taxi_screen.dart';
import 'package:togu/screens/transport_screen.dart';
import 'package:togu/screens/travel_plan_screen.dart';
import 'package:togu/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeScreenProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TOGU',
        routes: {
          "/welcomeScreen" : (context) => const WelcomePage(),
          "/loginScreen" : (context) => const LoginScreen(),
          "/signupScreen" : (context) => const CreateAccountScreen(),
          "/homeScreen" : (context) => const HomeScreen(),
          "/transportScreen" : (context) => const TransportScreen(),
          "/restaurantScreen" : (context) => const RestaurantScreen(),
          "/travelScreen" : (context) => const TravelPlanScreen(),
          "/otherScreen" : (context) => const OtherScreen(),
          "/busesScreen" : (context) => const BusesScreen(),
          "/taxiScreen" : (context) => const TaxiScreen(),
          "/carRentalScreen" : (context) => const CarRentalScreen(),
          "/detailScreen" : (context) => const DetailsScreen(),
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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 1)),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              return const WelcomePage();
            }
            else {
              return const SplashPage();
            }
          },
        ),
      ),
    );
  }
}

