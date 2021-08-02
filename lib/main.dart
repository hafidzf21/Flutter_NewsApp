import 'package:flutter/material.dart';
import 'package:newsapp/pages/homepages.dart';
import 'package:newsapp/pages/menu/list_pages.dart';
import 'package:newsapp/pages/menu/lottie.dart';
import 'package:newsapp/pages/splashScreen.dart';
import 'package:newsapp/providers/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (ctx) => Auth(),
      ),
    ],
    builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
        routes: {
          '/' : (BuildContext _) => SplashScreen(),
          '/home' : (BuildContext _) => HomePage(),
          '/kategori' : (BuildContext _) => ListPages(),
          '/lottie' : (BuildContext _) => LottiePages(),
        },
      initialRoute: '/',
      ),
    );
  }
}
