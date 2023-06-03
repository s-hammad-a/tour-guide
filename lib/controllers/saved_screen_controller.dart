import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../firebase/firebase_auth.dart';

class SavedScreenProvider extends ChangeNotifier {
  List<String> places = [];
  final DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child("/");

  Future<void> getPlaces() async {
    places = [];
    Query query = databaseReference.child("${AuthService().auth.currentUser!.uid}/Saved/");
    await query.once().then((value) {
      for (var element in value.snapshot.children) {
        places.add((element.value as Map)['name']);
        print(places.length);
        // notifyListeners();
      }
    });
  }


}