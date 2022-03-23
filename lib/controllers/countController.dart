// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CountController extends GetxController {
  int count = 0; //no need for .obs
  final number = TextEditingController().obs;

  void increment() {
    if (number.value.text.isNotEmpty) {
      count += int.parse(number.value.text);
    } else {
      count++;
    }
    // use update method to update all count variables
    update();
  }

  void decrement() {
    if (number.value.text.isNotEmpty) {
      count -= int.parse(number.value.text);
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
