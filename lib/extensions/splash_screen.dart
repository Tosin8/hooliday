import 'package:flutter/material.dart';
import 'package:hooliday/extensions/forms/login.dart';
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
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.1),
                ],
                begin: Alignment.bottomRight,
              )),
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 180),
                  child: Column(children: [
                    Text(
                      'Hooliday',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: 'Fleur De Leah'),
                    ),
                    SizedBox(height: 100),
                    Column(
                      children: [
                        Text(
                          'Take a break from\n your busy life',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Visit amazing pieces around the world,\n recharge your energy and enjoy your time.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 30),
                        SplashBtn(),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'I have an account',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignIn()));
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ])),
            )));
  }
}
