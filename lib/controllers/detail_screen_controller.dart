import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DetailScreenProvider extends ChangeNotifier {
  Map details = {};
  String name = "";
  final DatabaseReference riyadhBusRef = FirebaseDatabase.instance.reference().child('riyadhBus');
  final DatabaseReference mamoRef = FirebaseDatabase.instance.reference().child('mamo');
  final DatabaseReference zafranIndianBistroRef = FirebaseDatabase.instance.reference().child('zafranIndianBistro');
  final DatabaseReference taxiTerminalRef = FirebaseDatabase.instance.reference().child('taxiTerminal');
  final DatabaseReference yeloRef = FirebaseDatabase.instance.reference().child('yelo');
  final DatabaseReference boulevardWorldRef = FirebaseDatabase.instance.reference().child('boulevardWorld');
  final DatabaseReference museumRef = FirebaseDatabase.instance.reference().child('museum');
  final DatabaseReference tempRef = FirebaseDatabase.instance.reference().child('/');
  Future<void> getFromDatabase() async {
    details = {};
    Query query = name == "Mamo" ? mamoRef : name == "Zafran Indian Bistro" ? zafranIndianBistroRef : name == "Riyadh Bus" ? riyadhBusRef : name == "Taxi Terminal" ? taxiTerminalRef : name == "YELO" ? yeloRef : name == "Boulevard World" ? boulevardWorldRef : name == "National Museum of Saudi Arabia" ? museumRef : tempRef;
    await query.once().then((value) {
      details = value.snapshot.value as Map;
    });
  }

}