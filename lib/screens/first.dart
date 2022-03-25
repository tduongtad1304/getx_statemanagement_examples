import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/countController.dart';
import '../controllers/sumController.dart';
import '../controllers/userController.dart';
import '../widgets/custom_text_field.dart';
import 'second.dart';

class First extends StatelessWidget {
  First({Key? key}) : super(key: key);

  final CountController countController = Get.put(CountController());
  final SumController sumController = Get.put(SumController());
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("GetX | State Management"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CountController>(
              // You can initialize your controller here the first time. Don't use init in your other GetBuilders of same controller
              // GetX/Obx is reactive (streams) while GetBuilder only rebuilds on update()
              builder: (s) => Text(
                'Current Count Value: ${s.count}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomTextField(
                isAlign: false,
                controller: userController.nameController.value,
                keyboardType: TextInputType.name,
                labelText: 'Enter your name',
                fontSize: 19,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GetX<UserController>(
              // can initialize inside GetX instead of .put
              builder: (_) => Text(
                'Name: ${_.user.value.name}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
            ),
            Obx(
              //Obx is very similar to GetX except 'lighter' so no parameters for init, dispose, etc
              () => Column(
                children: [
                  Text(
                    'Stored Count: ${userController.user.value.count}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    'Sum: ${sumController.sum}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text(
                "Update Name & Stored Count",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
              onPressed: () {
                userController.updateUser(
                  countController.count,
                  userController.nameController.value.text,
                );
                //using Get.find locates the controller that was created in 'init' in GetX
              },
            ),
            ElevatedButton(
              child: const Text(
                'Next Screen',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
              onPressed: () {
                Get.to(() => Second(), transition: Transition.cupertino);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Enter a number '),
          SizedBox(
            width: 75,
            height: 50,
            child: CustomTextField(
              isAlign: true,
              controller: countController.number,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
              backgroundColor: Colors.green,
              heroTag: 'increment',
              tooltip: 'Increment',
              child: const Icon(Icons.add),
              onPressed: () {
                countController.increment();
              }),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
              backgroundColor: Colors.red,
              heroTag: 'decrement',
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
              onPressed: () {
                countController.decrement();
              }),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
              backgroundColor: Colors.grey,
              heroTag: 'reset',
              tooltip: 'Reset',
              child: const Icon(Icons.restore_rounded),
              onPressed: () {
                countController.reset();
              }),
        ],
      ),
    );
  }
}
