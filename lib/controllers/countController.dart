// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CountController extends GetxController {
  int count = 0; //no need for .obs
  final number = TextEditingController();

  void increment() {
    if (number.text.isNotEmpty) {
      count += int.parse(number.text);
    } else {
      count++;
    }
    // use update method to update all count variables
    update();
  }

  void decrement() {
    if (number.text.isNotEmpty) {
      count -= int.parse(number.text);
    } else {
      count--;
    }
    // use update method to update all count variables
    update();
  }

  void reset() {
    count = 0;
    // use update method to update all count variables
    update();
  }
}
