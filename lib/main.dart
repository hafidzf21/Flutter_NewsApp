import 'package:flutter/material.dart';
import './routes/page_route.dart';
import 'package:get/get.dart';

import './controllers/counter_controller.dart';

import 'package:flutter_getx/pages/homepage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final counterC = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: counterC.isDark.value ? ThemeData.dark() : ThemeData.light(),
        home: HomePage(),
        getPages: RoutePage.pages,
        
      ),
    );
  }
}
