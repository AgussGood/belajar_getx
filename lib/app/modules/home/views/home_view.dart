import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:belajar_getx/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade400,
      ),
      body: const Center(
        child: Text(
          "Selamat Datang di Aplikasi",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),

      /// FOOTER MENU
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue.shade400,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exposure_plus_1),
            label: "Counter",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "Formulir",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: "Penjualan",
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Get.toNamed(Routes.COUNTER);
          } else if (index == 2) {
            Get.toNamed(Routes.FORMULIR);
          } else if (index == 3) {
            Get.toNamed(Routes.PENJUALAN);
          }
        },
      ),
    );
  }
}
