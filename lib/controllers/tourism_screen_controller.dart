import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TourismScreenProvider extends ChangeNotifier {
  List<Map> details = [];
  List<TextEditingController> placeControllers = List.generate(7, (index) => TextEditingController());
  DateTime date = DateTime.now();

  Future<void> getDetails() async {
    details = [];
    Query query = FirebaseDatabase.instance.reference().child("tourism");
    await query.once().then((value) {
      for (var element in value.snapshot.children) {
        details.add(element.value as Map);
        details.last.putIfAbsent("id", () => element.key);
      }
    });
    print(details);
  }

  void updateDate(DateTime value) {
    date = value;
    notifyListeners();
  }

  Future<void> addPlans() async {
    Map map = {"date" : date.toString()};
    int j = 0;
    for(int i = 0; i < placeControllers.length; i++) {
      if(placeControllers[i].text.isNotEmpty) {
        map.putIfAbsent(j, () => placeControllers[i].text);
        j++;
      }
    }
    await FirebaseDatabase.instance.reference().child("tourism").push().set(map);
    await getDetails();
    notifyListeners();
  }

  Future<void> deletePlan(int index) async {
    await FirebaseDatabase.instance.reference().child("tourism").child(details[index]['id']).remove();
    details.removeAt(index);
    notifyListeners();
  }

}