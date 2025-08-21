import 'package:belajar_getx/app/modules/formulir/views/formulir_output_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/formulir_controller.dart';

class FormulirView extends GetView<FormulirController> {
  const FormulirView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text(
          'Formulir Pendaftaran',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade400,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Pilih Kursus',
                    prefixIcon: Icon(Icons.school),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  items: controller.courses.map((course) {
                    return DropdownMenuItem(
                      value: course,
                      child: Text(course),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.SelectedCourses.value = value!;
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  "Jenis Kelamin",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700]),
                ),
                Obx(
                  () => Column(
                    children: [
                      RadioListTile(
                        title: Text("Laki-laki"),
                        value: 'Laki-laki',
                        groupValue: controller.gender.value,
                        onChanged: (value) {
                          controller.gender.value = value!;
                        },
                      ),
                      RadioListTile(
                        title: Text("Perempuan"),
                        value: 'Perempuan',
                        groupValue: controller.gender.value,
                        onChanged: (value) {
                          controller.gender.value = value!;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Tanggal Lahir',
                      prefixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    controller: TextEditingController(
                      text: controller.formattedDate,
                    ),
                    onTap: () => controller.pickDate(),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.to(FormulirOutputView()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade400,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                    ),
                    child: const Text(
                      'Submit',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
