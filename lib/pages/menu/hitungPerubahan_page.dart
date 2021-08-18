import 'package:flutter/material.dart';
import 'package:flutter_getx/controllers/hitung_controller.dart';
import 'package:get/get.dart';

class HitungPerubahan extends StatelessWidget {
  final hitungC = Get.put(HitungController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hitung Perubahan"),
        actions: [
          IconButton(
            onPressed: () => {
              Get.defaultDialog(
                barrierDismissible: false,
                title: "Halaman direset",
                middleText: "Perubahan data akan dihapus",

                // Default GetX Dialog
                textConfirm: "Okee",
                confirmTextColor: Colors.white,
                onConfirm: () {
                  hitungC.reset();
                  Get.back();
                  Get.to(() => HitungPerubahan());
                },

                textCancel: "Batal",
                onCancel: () {
                  HitungPerubahan();
                },
              ),
            },
            icon: Icon(Icons.restart_alt),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  "Terjadi sesuatu : ${hitungC.count} x",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                onChanged: (_) => hitungC.change(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
