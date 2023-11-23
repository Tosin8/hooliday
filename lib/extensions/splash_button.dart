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
    return Container(
        width: 300,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ));
  }
}
