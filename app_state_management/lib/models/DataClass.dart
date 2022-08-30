import 'package:flutter/material.dart';

class DataClass extends ChangeNotifier {
  late String _title = "";
  late String _subtitle = "";

  String get title => _title;
  String get subtitle => _subtitle;

  DataClass(String title, String subtitle) {
    _title = title;
    _subtitle = subtitle;
  }

  void update(title, subtitle) {
    _title = title;
    _subtitle = subtitle;
    notifyListeners();
  }

}
