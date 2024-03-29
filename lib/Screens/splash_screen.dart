import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, 'home');
    });
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Image.asset("assets/img/quotes.png", height: 150),
      ),
    ));
  }
}
