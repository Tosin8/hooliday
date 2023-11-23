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
                  image: AssetImage('assets/splash_screen2.jpg'),
                  fit: BoxFit.cover),
            ),
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.1),
                  ],
                  begin: Alignment.bottomRight,
                )),
                child: Column(
                  children: [
                    Text(
                      'Hooliday',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ))));
  }
}
