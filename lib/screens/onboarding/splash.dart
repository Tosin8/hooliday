import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';  // For a loading animation (optional)
import 'dart:async';

import 'onboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const TravelHome()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey, // Set the background color of your choice
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.airplanemode_active, size: 100, color: Colors.white),
            SizedBox(height: 20),
            SpinKitFadingCircle( // Optional loading animation
              color: Colors.white,
              size: 50.0,
            ),
            SizedBox(height: 20),
            Text('Travel Explorer', style: TextStyle(color: Colors.white, fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
