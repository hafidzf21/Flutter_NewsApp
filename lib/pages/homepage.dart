import 'package:flutter/material.dart';
import 'package:flutter_getx/routes/route_name.dart';
import 'package:get/get.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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
                leading: Icon(Icons.exposure)),
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
      body: Center(),
      floatingActionButton: SpeedDial(
        icon: Icons.share,
        children: [
          SpeedDialChild(
            child: Icon(Icons.face),
            label: 'Social Network',
            onTap: () {
              Get.bottomSheet(
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    color: Colors.white70,
                    child: Center(
                      child: ListView(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Enter Your Text...",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Enter Your Text...",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Enter Your Text...",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("Submit"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.email),
            label: 'Email',
            onTap: () {/* Do something */},
          ),
          SpeedDialChild(
            child: Icon(Icons.chat),
            label: 'Message',
            onTap: () {/* Do something */},
          ),
        ],
      ),
    );
  }
}
