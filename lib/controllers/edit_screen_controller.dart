import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class EditScreenProvider extends ChangeNotifier {
  String name = "";
  TextEditingController contactController = TextEditingController();
  TextEditingController socialController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descController = TextEditingController();
  bool updateButton = false;
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

  Future<void> updateInformation() async {
    DatabaseReference databaseReference = name == "Mamo" ? mamoRef : name == "Zafran Indian Bistro"
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
    await databaseReference.update({
      "contact" : contactController.text,
      "twitter" : socialController.text,
      "email" : emailController.text,
      "website" : websiteController.text,
      "location" : locationController.text,
      "desc" : descController.text,
    });
    updateButton = false;
    notifyListeners();
  }

  void setUpdateButton(bool value) {
    updateButton = value;
    notifyListeners();
  }
}
