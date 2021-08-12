import 'package:flutter/material.dart';
import 'package:flutter_getx/routes/route_name.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Belajar GetX"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: [
            ListTile(
              onTap: () {
                Get.toNamed(RouteName.homepage);
              },
              title: Text('Home'),
              leading: Icon(Icons.dashboard),
            ),
            ListTile(
              onTap: () {
                Get.toNamed(RouteName.counter_page);
              },
              title: Text('Counter App'),
              leading: Icon(Icons.exposure)
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 10),
              child: Text('Labels',
                  style: TextStyle(fontSize: 14, color: Colors.black54)),
            ),
            ListTile(
              onTap: () {
                Get.toNamed(RouteName.hitung_page);
              },
              title: Text('Hitung App'),
              leading: Icon(Icons.keyboard),
            ),
          ],
        ),
      ),
    );
  }
}
