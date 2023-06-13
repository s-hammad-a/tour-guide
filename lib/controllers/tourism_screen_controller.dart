import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:togu/firebase/firebase_auth.dart';

class TourismScreenProvider extends ChangeNotifier {
  List<Map> details = [];
  List<TextEditingController> placeControllers = List.generate(7, (index) => TextEditingController());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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

  Future<bool> addReservation(String id) async {
    if(nameController.text.isNotEmpty && emailController.text.isNotEmpty) {
      await FirebaseDatabase.instance.reference().child(AuthService().auth.currentUser!.uid).child("Reservations").push().set({
        "id" : id,
        "name" : nameController.text,
        "email" : emailController.text,
        "date" : details[(details.indexWhere((element) => element['id'] == id))]['date'],
        "type" : 1,
      }).onError((error, stackTrace) {
        print(error.toString());
      });
      return true;
    }
    return false;
  }

}