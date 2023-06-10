import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:togu/firebase/firebase_auth.dart';

class ReservationProvider extends ChangeNotifier {
  DateTime date = DateTime.now();
  TimeOfDay time = const TimeOfDay(hour: 0, minute: 0);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child("${AuthService().auth.currentUser!.uid}/Reservations/");


  Future<bool> addReservation(BuildContext context, String name) async {
    if(nameController.text.isNotEmpty && phoneController.text.isNotEmpty) {
      await databaseReference.push().set({
        "restaurant" : name,
        "date" : date.toString(),
        "time" : time.format(context),
        "name" : nameController.text,
        "contact" : phoneController.text
      }).onError((error, stackTrace) {
        print(error.toString());
      });
      return true;
    }
    return false;
  }

  void updateTime(TimeOfDay value) {
    time = value;
    notifyListeners();
  }

  void updateDate(DateTime value) {
    date = value;
    notifyListeners();
  }

}