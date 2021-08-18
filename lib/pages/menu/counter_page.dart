import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/counter_controller.dart';

class CounterPages extends StatelessWidget {
  final c = Get.find<CounterController>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Counter App with GetX"),
        actions: [
          IconButton(
            icon: Icon(Icons.dark_mode),
            onPressed: () => {
              c.changeTheme(),
              Get.snackbar(
                "Tema Aplikasi",
                "Tema telah diubah",
                  animationDuration: Duration(seconds: 1),
                  duration: Duration(seconds: 2),
              ),
            },
          ),
        ],
      ),
      body: Center(
        child: Obx(
          () => Text(
            "ANGKA ${c.counter}",
            style: TextStyle(
              fontSize: 35,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        children: [
          Positioned(
            right: 10,
            bottom: 10,
            child: FloatingActionButton(
              heroTag: 'Tambah',
              child: Icon(Icons.add),
              onPressed: () => {
                c.increment(),
                Get.snackbar(
                  "Penambahan Data",
                  "Menambahkan nilai dengan angka 1",
                  animationDuration: Duration(milliseconds: 500),
                  duration: Duration(milliseconds: 500),
                  icon: Icon(Icons.add),
                  backgroundGradient: LinearGradient(
                    colors: [
                      Colors.purple,
                      Colors.green,
                    ],
                  ),
                ),
              },
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: FloatingActionButton(
              heroTag: 'Kurang',
              child: Icon(Icons.remove),
              onPressed: () => {
                c.decrement(),
                Get.snackbar(
                  "Pengurangan Data",
                  "Mengurangi nilai dengan angka 1",
                  animationDuration: Duration(milliseconds: 500),
                  duration: Duration(milliseconds: 500),
                  icon: Icon(Icons.remove),
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
