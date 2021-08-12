import 'package:flutter/material.dart';
import 'package:flutter_getx/controllers/counter_controller.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final counterC = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: counterC.isDark.value ? ThemeData.dark() : ThemeData.light(),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final c = Get.find<CounterController>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Counter App with GetX"),
        actions: [
          IconButton(
            icon: Icon(Icons.dark_mode),
            onPressed: () => c.changeTheme(),
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
              onPressed: () => c.increment(),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: FloatingActionButton(
              heroTag: 'Kurang',
              child: Icon(Icons.remove),
              onPressed: () => c.decrement(),
            ),
          ),
        ],
      ),
    );
  }
}
