import 'package:flutter/material.dart';
import 'package:newsapp/pages/homepages.dart';
import 'package:newsapp/pages/listkategori/list_pages/list_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' : (BuildContext _) => HomePage(),
        '/kategori' : (BuildContext _) => ListPages(),
      },
      initialRoute: '/',
    );
  }
}
