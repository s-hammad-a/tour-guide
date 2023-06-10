import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:togu/firebase/firebase_auth.dart';

class DetailScreenProvider extends ChangeNotifier {
  Map details = {};
  List<Map> reviews = [];
  String name = "";
  bool isSaved = false;
  final DatabaseReference riyadhBusRef = FirebaseDatabase.instance.reference().child('riyadhBus');
  final DatabaseReference mamoRef = FirebaseDatabase.instance.reference().child('Mamo');
  final DatabaseReference zafranIndianBistroRef = FirebaseDatabase.instance.reference().child('zafranIndianBistro');
  final DatabaseReference taxiTerminalRef = FirebaseDatabase.instance.reference().child('taxiTerminal');
  final DatabaseReference yeloRef = FirebaseDatabase.instance.reference().child('yelo');
  final DatabaseReference boulevardWorldRef = FirebaseDatabase.instance.reference().child('boulevardWorld');
  final DatabaseReference museumRef = FirebaseDatabase.instance.reference().child('museum');
  final DatabaseReference hiltonRiyadhRef = FirebaseDatabase.instance.reference().child('hiltonRiyadh');
  final DatabaseReference saptcoRef = FirebaseDatabase.instance.reference().child('saptco');
  final DatabaseReference goTaxiRef = FirebaseDatabase.instance.reference().child('GoTaxi');
  final DatabaseReference yahmaCompanyRef = FirebaseDatabase.instance.reference().child('YahmaCompany');
  final DatabaseReference wasmCompanyRef = FirebaseDatabase.instance.reference().child('WasmCompany');
  final DatabaseReference alBujairiviewRef = FirebaseDatabase.instance.reference().child('AlBujairiview');
  final DatabaseReference lastHourRef = FirebaseDatabase.instance.reference().child('LastHour');
  final DatabaseReference iLbrettoRef = FirebaseDatabase.instance.reference().child('ILbretto');
  final DatabaseReference ciprianiRef = FirebaseDatabase.instance.reference().child('Cipriani');
  final DatabaseReference tempRef = FirebaseDatabase.instance.reference().child('/');
  final DatabaseReference savedRef = FirebaseDatabase.instance.reference().child('/');
  TextEditingController review = TextEditingController();

  Future<void> getFromDatabase(String name) async {
    details = {};
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
      details = value.snapshot.value as Map;
    });
    isSaved = false;
    await savedRef.child(AuthService().auth.currentUser!.uid)
        .child("Saved").once().then((value) {
          for (var element in value.snapshot.children) {
            print(element.value);
            if((element.value as Map)['name'] == name) {
              isSaved = true;
            }
          }
        });
    notifyListeners();
  }

  Future<void> savePlace(String name) async {
    if(!isSaved){
      await savedRef.child(AuthService().auth.currentUser!.uid).child("Saved").push().set({
        "name": name,
      });
      isSaved = true;
    }
    else {
      Query query = savedRef.child(AuthService().auth.currentUser!.uid).child("Saved");
      await query.once().then((value) {
        for (var element in value.snapshot.children) {
          if((element.value as Map)['name'] == name) {
            savedRef.child(AuthService().auth.currentUser!.uid).child("Saved").child(element.key!).remove();
          }
        }
      });
      isSaved = false;
    }
    notifyListeners();
  }

  Future<void> getAllReviews() async {
    reviews = [];
    DatabaseReference ref = name == "Mamo" ? mamoRef : name == "Zafran Indian Bistro"
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
    Query query = ref.child("Reviews");
    await query.once().then((value) {
      for(var element in value.snapshot.children) {
        reviews.add(element.value as Map);
      }
    });
  }

  Future<void> addReviews() async {
    reviews = [];
    DatabaseReference ref = name == "Mamo" ? mamoRef : name == "Zafran Indian Bistro"
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
    await ref.child("Reviews").push().set({
      "name" : AuthService().auth.currentUser!.displayName,
      "review" : review.text,
    });
    reviews.add({
      "name" : AuthService().auth.currentUser!.displayName,
      "review" : review.text,
    });
    review.clear();
    notifyListeners();
  }

}