import 'package:flutter/material.dart';
import 'package:hooliday/extensions/splash_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/splash_screen2.jpg'), fit: BoxFit.cover),
      ),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.6),
              Colors.white.withOpacity(0)
            ],
            begin: Alignment.bottomRight,
          )),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Hooliday',
                  style: TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Fleur De Leah'),
                ),
                SizedBox(height: 50),
                Text(
                  'Explore Your World',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 1.2),
                ),
                Text(
                  'Everyday is an Hooliday',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      height: 0),
                ),
                SizedBox(height: 20),
                SplashBtn()
              ],
            ),
          )),
    ));
  }
}
