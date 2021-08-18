import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountPage extends StatelessWidget {
  final count = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Count Page Get.putAsync"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "$count",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.putAsync<SharedPreferences>(
          () async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setInt('counter', 2114);

            count.value = prefs.getInt('counter')!.toInt();
            return prefs;
          },
        ),
        child: Icon(Icons.preview),
      ),
    );
  }
}
