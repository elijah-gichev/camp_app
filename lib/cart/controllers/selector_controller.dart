import 'package:flutter/material.dart';

class SelectorController extends ChangeNotifier {
  int selectedIndex = 0;
  void selectCategory(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  bool isSelectedIndex(int index) {
    return index == selectedIndex;
  }
}
