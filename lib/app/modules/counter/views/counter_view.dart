// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  CounterView({super.key});

  CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 👇 efek font berubah sesuai nilai
            Obx(
              () => AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                style: TextStyle(
                  fontSize: 20 + controller.count.value * 2.0, // nambah nilai → nambah ukuran font
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                child: Text(controller.count.value.toString()),
              ),
            ),
            const SizedBox(height: 20),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ElevatedButton(
              onPressed: () => controller.increment(),
              child: const Text('Tambah'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () => controller.decrement(), // diganti biar jelas
              child: const Text('Kurang'),
            ),
            ],
            ),
          ],
        ),
      ),
    );
  }
}
