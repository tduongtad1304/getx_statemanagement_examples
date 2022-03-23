// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user.dart';

class UserController extends GetxController {
  final user = User().obs;
  final nameController = TextEditingController().obs;

  updateUser(int count, String name) {
    // //Option #1
    // user().name = 'Tad';

    // user().count = count;

    //Option #2
    user.update((value) {
      value?.name = nameController.value.text;
      value?.count = count;
    });
  }
}
