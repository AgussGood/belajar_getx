import 'package:belajar_getx/app/modules/formulir/controllers/formulir_controller.dart';
import 'package:belajar_getx/app/modules/formulir/views/formulir_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormulirOutputView extends StatelessWidget {
  FormulirOutputView({super.key});

  final FormulirController formulir = Get.find<FormulirController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text(
          'Hasil Formulir',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade400,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Nama
                  ListTile(
                    leading: Icon(Icons.person, color: Colors.blue.shade400),
                    title: Text("Nama"),
                    subtitle: Text(
                      formulir.nameController.text,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),

                  /// Kursus
                  ListTile(
                    leading: Icon(Icons.school, color: Colors.blue.shade400),
                    title: Text("Kursus"),
                    subtitle: Text(
                      formulir.SelectedCourses.value,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),

                  /// Tanggal Lahir
                  ListTile(
                    leading:
                        Icon(Icons.calendar_today, color: Colors.blue.shade400),
                    title: Text("Tanggal Lahir"),
                    subtitle: Text(
                      formulir.formattedDate,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),

                  /// Gender
                  ListTile(
                    leading: Icon(Icons.wc, color: Colors.blue.shade400),
                    title: Text("Jenis Kelamin"),
                    subtitle: Text(
                      formulir.gender.value,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// Tombol kembali
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        formulir.clearForm();
                        Get.off(() => const FormulirView());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade400,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text(
                        "Kembali",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
