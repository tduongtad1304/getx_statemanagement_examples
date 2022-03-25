// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sumController.dart';
import 'only_sum.dart';

class Second extends StatelessWidget {
  Second({Key? key}) : super(key: key);

  final SumController sumController = Get.put(SumController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<SumController>(
              //You can use bindings instead of init. Bindings are when this widget gets
              //rendered, you can create your Controller
              builder: (_) {
                print("count1 rebuild");
                return Text(
                  'Counter #1:    ${_.count1.value}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                );
              },
            ),
            const Text("                        +"),
            GetX<SumController>(
              builder: (_) {
                print("count2 rebuild");
                return Text(
                  'Counter #2:    ${_.count2.value}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                );
              },
            ),
            const Text("                        ="),
            GetX<SumController>(builder: (_) {
              print("sum rebuild");
              return Text(
                'Sum:                 ${_.sum}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              );
            }),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: const Text("Increment Counter #1"),
              onPressed: () {
                sumController.increment();
              },
            ),
            ElevatedButton(
              child: const Text("Increment Counter #2"),
              onPressed: () {
                sumController.increment2();
              },
            ),
            ElevatedButton(
              child: const Text("Go back to Screen #1 with sum value"),
              onPressed: () {
                Get.back(result: sumController.sum);
                Get.snackbar(
                  'GetX Snackbar',
                  '',
                  messageText: const Text(
                    'Tap to see the only sum',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  icon: const Icon(Icons.control_point_duplicate_rounded),
                  duration: const Duration(seconds: 3),
                  backgroundColor: Colors.white,
                  onTap: (_) {
                    Get.to(
                      () => const OnlySum(),
                      arguments: sumController.sum,
                      transition: Transition.cupertino,
                    );
                  },
                );
              },
            ),
            ElevatedButton(
              child: const Text("Reset counter & sum and back to Screen #1"),
              onPressed: () {
                sumController.reset();
                Get.back(result: sumController.sum);
                Get.snackbar(
                  'GetX Snackbar',
                  '',
                  messageText: const Text(
                    'Reset sum to 0!',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  icon: const Icon(Icons.exposure_zero_outlined),
                  duration: const Duration(seconds: 2),
                  backgroundColor: Colors.white,
                  onTap: (_) {
                    Get.to(
                      () => const OnlySum(),
                      arguments: sumController.sum,
                      transition: Transition.cupertino,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
