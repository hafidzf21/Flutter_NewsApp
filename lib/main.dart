import 'package:flutter/material.dart';
import 'package:flutter_getx/pages/hitungPerubahan_pages.dart';
import 'package:get/get.dart';

import './controllers/counter_controller.dart';
import './pages/counter_page.dart';

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
        home: HitungPerubahan(),
      ),
    );
  }
}
