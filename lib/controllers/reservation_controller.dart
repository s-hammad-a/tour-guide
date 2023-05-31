import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ReservationProvider extends ChangeNotifier {
  DateTime date = DateTime.now();
  TimeOfDay time = const TimeOfDay(hour: 0, minute: 0);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final DatabaseReference riyadhBusRef = FirebaseDatabase.instance.reference().child('/');


  void addReservation() {
    if(nameController.text.isNotEmpty && phoneController.text.isNotEmpty) {

    }
  }
}