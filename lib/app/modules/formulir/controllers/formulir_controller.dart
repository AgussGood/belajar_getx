import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormulirController extends GetxController {
  //TODO: Implement FormulirController
  final nameController = TextEditingController();

  final SelectedCourses = ''.obs;
  List<String> courses = ['Flutter', 'Dart', 'Java', 'Pyhton', 'JavaScript'];

  final gender = ''.obs;

  final SelectedDate = DateTime.now().obs;
  String get formattedDate =>
      DateFormat('dd/MM/yyyy').format(SelectedDate.value);

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: SelectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != SelectedDate.value) {
      SelectedDate.value = picked;
    }
  }

  void clearForm() {
    nameController.clear();
    SelectedCourses.value = '';
    gender.value = '';
    SelectedDate.value = DateTime.now();
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
