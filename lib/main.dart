import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/first.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //don't need 'Get' before Material App if you're only using State Management
      home: First(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    ),
  );
}
