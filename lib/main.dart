import 'package:flutter/material.dart';
import 'package:newsapp/pages/homepages.dart';
import 'package:newsapp/pages/menu/detail_menu/add_student_pages.dart';
import 'package:newsapp/pages/menu/detail_menu/detail_student_pages.dart';
import 'package:newsapp/pages/menu/list_pages.dart';
import 'package:newsapp/pages/menu/lottie.dart';
import 'package:newsapp/pages/menu/student_pages.dart';
import 'package:newsapp/pages/splashScreen.dart';
import 'package:newsapp/providers/auth.dart';
import 'package:newsapp/providers/student.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(
        create: (ctx) => Auth(),
      ),
      ChangeNotifierProvider(
        create: (ctx) => Students(),
      ),
    ],
    builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
        routes: {
          '/' : (BuildContext _) => SplashScreen(),
          '/home' : (BuildContext _) => HomePage(),
          '/kategori' : (BuildContext _) => ListPages(),
          '/lottie' : (BuildContext _) => LottiePages(),
          '/student' : (BuildContext _) => StudentPage(),
          AddStudent.routeName: (context) => AddStudent(),
          DetailStudent.routeName: (context) => DetailStudent(),
        },
      initialRoute: '/',
      ),
    );
  }
}
