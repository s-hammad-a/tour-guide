import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:togu/modules/BookingDetails.dart';

import '../firebase/firebase_auth.dart';

class BookingProvider extends ChangeNotifier {
  List<BookingDetails> bookings = [];
  final DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child("${AuthService().auth.currentUser!.uid}/Reservations/");
  
  Future<void> getBookings() async {
    bookings = [];
    Query query = databaseReference;
    await query.once().then((value) {
      for (var element in value.snapshot.children) {
        // jsonDecode(element.value.toString());
        print("element.value");
        print("pp${element.value}pp");
        bookings.add(BookingDetails.fromJson(element.value as Map));
        print(bookings.length);
        // notifyListeners();
      }
    });
  }
}