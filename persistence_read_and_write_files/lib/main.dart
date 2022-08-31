import 'package:flutter/material.dart';
import 'package:persistence_read_and_write_files/CustomDataStorage.dart';
import 'package:persistence_read_and_write_files/CustomForm.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Reading and Writing Files',
      home: CustomForm(storage: CustomDataStorage()),
    ),
  );
}
