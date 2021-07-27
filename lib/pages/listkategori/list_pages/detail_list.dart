import 'package:flutter/material.dart';

class DetailList extends StatefulWidget {
  @override
  _DetailListState createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detail Kategori"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: Text(
          "Ini adalah halaman detail list kategori",
          style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
