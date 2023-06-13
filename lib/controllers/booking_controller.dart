import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:togu/modules/BookingDetails.dart';

import '../firebase/firebase_auth.dart';

class BookingProvider extends ChangeNotifier {
  List<BookingDetails> bookings = [];
  List<Map> tourismBookings = [];
  final DatabaseReference riyadhBusRef = FirebaseDatabase.instance.reference().child('riyadhBus').child("Reservations");
  final DatabaseReference mamoRef = FirebaseDatabase.instance.reference().child('Mamo').child("Reservations");
  final DatabaseReference zafranIndianBistroRef = FirebaseDatabase.instance.reference().child('zafranIndianBistro').child("Reservations");
  final DatabaseReference taxiTerminalRef = FirebaseDatabase.instance.reference().child('taxiTerminal').child("Reservations");
  final DatabaseReference yeloRef = FirebaseDatabase.instance.reference().child('yelo').child("Reservations");
  final DatabaseReference boulevardWorldRef = FirebaseDatabase.instance.reference().child('boulevardWorld').child("Reservations");
  final DatabaseReference museumRef = FirebaseDatabase.instance.reference().child('museum').child("Reservations");
  final DatabaseReference hiltonRiyadhRef = FirebaseDatabase.instance.reference().child('hiltonRiyadh').child("Reservations");
  final DatabaseReference saptcoRef = FirebaseDatabase.instance.reference().child('saptco').child("Reservations");
  final DatabaseReference goTaxiRef = FirebaseDatabase.instance.reference().child('GoTaxi').child("Reservations");
  final DatabaseReference yahmaCompanyRef = FirebaseDatabase.instance.reference().child('YahmaCompany').child("Reservations");
  final DatabaseReference wasmCompanyRef = FirebaseDatabase.instance.reference().child('WasmCompany').child("Reservations");
  final DatabaseReference alBujairiviewRef = FirebaseDatabase.instance.reference().child('AlBujairiview').child("Reservations");
  final DatabaseReference lastHourRef = FirebaseDatabase.instance.reference().child('LastHour').child("Reservations");
  final DatabaseReference iLbrettoRef = FirebaseDatabase.instance.reference().child('ILbretto').child("Reservations");
  final DatabaseReference ciprianiRef = FirebaseDatabase.instance.reference().child('Cipriani').child("Reservations");
  final DatabaseReference tempRef = FirebaseDatabase.instance.reference().child('/').child("Reservations");
  final DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child("/");

  Future<void> getBookings() async {
    bookings = [];
    tourismBookings = [];
    Query query = databaseReference.child("${AuthService().auth.currentUser!.uid}/Reservations/");
    await query.once().then((value) {
      for (var element in value.snapshot.children) {
        print(element.value);
        Map map = element.value as Map;
        if(map['type'] == null ){
          bookings.add(BookingDetails.fromJson(element.value as Map, element.key.toString()));
        }
        else {
          tourismBookings.add(map);
          tourismBookings.last.putIfAbsent("ids", () => element.key);
        }
      }
    });
  }

  Future<void> getRestaurantBookings(String name) async {
    bookings = [];
    tourismBookings = [];
    Query query = name == "Mamo" ? mamoRef : name == "Zafran Indian Bistro"
        ? zafranIndianBistroRef
        : name == "Riyadh Bus" ? riyadhBusRef : name == "Taxi Terminal"
        ? taxiTerminalRef
        : name == "YELO" ? yeloRef : name == "Boulevard World"
        ? boulevardWorldRef
        : name == "National Museum of Saudi Arabia"
        ? museumRef
        : name == "Hilton Riyadh"
        ? hiltonRiyadhRef
        : name == "SAPTCO"
        ? saptcoRef
        : name == "Yahma Company"
        ? yahmaCompanyRef
        : name == "Wasm Company"
        ? wasmCompanyRef
        : name == "Al-Bujairi View"
        ? alBujairiviewRef
        : name == "Last Hour"
        ? lastHourRef
        : name == "Cipriani"
        ? ciprianiRef
        : name == "IL baretto"
        ? iLbrettoRef
        : name == "Go Taxi"
        ? goTaxiRef : tempRef;
    await query.once().then((value) {
      for (var element in value.snapshot.children) {
        print(element.value);
        bookings.add(BookingDetails.fromJson(element.value as Map, element.key.toString()));
      }
    });

  }

  Future<void> deleteBooking(String id) async {
    await FirebaseDatabase.instance.reference()
        .child(AuthService().auth.currentUser!.uid)
        .child("Reservations")
        .child(id)
        .remove();
    bookings.removeWhere((element) => element.id == id);
    tourismBookings.removeWhere((element) => element['ids'] == id);
    notifyListeners();
  }

  Future<void> deleteRestaurantBooking(String id, String name) async {
    BookingDetails booking = bookings.firstWhere((element) => element.id == id);
    await FirebaseDatabase.instance.reference()
        .child(name)
        .child("Reservations")
        .child(id)
        .remove();
    Query query = FirebaseDatabase.instance.reference().child(booking.restaurant).child("Reservations");
    await query.once().then((value) async {
      for (var element in value.snapshot.children) {
        Map map = element.value as Map;
        print("map");
        if(map['name'] == booking.name && map['contact'] == booking.phone && map['date'] == booking.date.toString() && map['time'] == booking.time) {
          print(booking.restaurant);
          await FirebaseDatabase.instance.reference().child(booking.restaurant).child("Reservations").child(element.key!).remove();
          bookings.removeWhere((element) => element.id == id);
        }
        else {
          print("sadfasdf");
        }
      }
    });
    notifyListeners();
  }
}


