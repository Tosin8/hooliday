import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/splash_screen.jpg'), fit: BoxFit.cover),
      ),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            const Color(0xff252222),
            Colors.white.withOpacity(0)
          ], begin: const Alignment(0.00, -1.00), end: const Alignment(0, 1))),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 300),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Hooliday',
                  style: TextStyle(
                      fontSize: 48,
                      color: Color(
                        0xff130f0f,
                      ),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Fleur De Leah'),
                ),
                Text(
                  'Explore Your World',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 1.2),
                )
              ],
            ),
          )),
    ));
  }
}
