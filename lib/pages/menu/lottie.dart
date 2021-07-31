import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottiePages extends StatefulWidget {
  @override
  _LottiePagesState createState() => _LottiePagesState();
}

class _LottiePagesState extends State<LottiePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lottie Animations"),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        child: Center(
          child: Lottie.asset('assets/animations/stay-home.json'),
        ),
      ),
    );
  }
}