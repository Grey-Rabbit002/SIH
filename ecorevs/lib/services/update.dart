import 'package:flutter/material.dart';

class GlobalData extends ChangeNotifier {
  List<double> _myList = [0, 0, 0];
  final int _p1 = 0;
  int get p1 => _p1;
  List<double> get lister => _myList;
  void updateList(List<double> newList) {
    // print("CCCCCCCCCCCCCCCCCCCCCCCCCCCRRRRRRRRRRRRRRRRRRRRRRRrr");
    // print(_myList);
    _myList = newList;
    // print(_myList);
    // notifyListeners();
  }
}
