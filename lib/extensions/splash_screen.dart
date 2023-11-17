import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/splash_screen.jpg'), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff252222), Colors.white.withOpacity(0)],
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1))),
      ),
    ));
  }
}
