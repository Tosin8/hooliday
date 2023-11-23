import 'package:flutter/material.dart';
import 'package:hooliday/extensions/bottom_navs.dart';
import 'package:hooliday/screens/home_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashBtn extends StatefulWidget {
  const SplashBtn({super.key});

  @override
  State<SplashBtn> createState() => _SplashBtnState();
}

class _SplashBtnState extends State<SplashBtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.bottomToTopPop,
              child: AppNavs(),
            ));
      },
      child: Container(
        width: 250,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Align(
            child: Text(
          'Book Trip',
          style: TextStyle(color: Colors.white, fontSize: 16),
        )),
      ),
    );
  }
}
