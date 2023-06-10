import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:togu/modules/BookingDetails.dart';

import '../firebase/firebase_auth.dart';

class BookingProvider extends ChangeNotifier {
  List<BookingDetails> bookings = [];
  final DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child("/");
  
  Future<void> getBookings() async {
    bookings = [];
    Query query = databaseReference.child("${AuthService().auth.currentUser!.uid}/Reservations/");
    await query.once().then((value) {
      for (var element in value.snapshot.children) {
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
    notifyListeners();
  }
}


