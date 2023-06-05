import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  int currentIndex = 1;
  bool isAdmin = false;

  void setCurrentIndex(int value) {
    currentIndex = value;
    notifyListeners();
  }

}