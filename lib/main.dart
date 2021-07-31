import 'package:flutter/material.dart';
import 'package:newsapp/pages/menu/list_pages.dart';
import 'package:newsapp/pages/menu/lottie.dart';
import 'package:newsapp/pages/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' : (BuildContext _) => SplashScreen(),
        '/kategori' : (BuildContext _) => ListPages(),
        '/lottie' : (BuildContext _) => LottiePages(),
      },
      initialRoute: '/',
    );
  }
}
