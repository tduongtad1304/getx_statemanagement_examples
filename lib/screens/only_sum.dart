import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_statemanagement/controllers/sumController.dart';

class OnlySum extends StatelessWidget {
  const OnlySum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Only Sum Page'),
      ),
      body: Center(
        child: GetBuilder<SumController>(
          init: SumController(),
          builder: (_) => Text(
            'Sum: ${_.sum}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
