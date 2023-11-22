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
      width: 58,
      height: 107,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 58,
              height: 107,
              decoration: ShapeDecoration(
                gradient: const LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [Color(0xFFD9D9D9), Color(0xCC000000)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
          ),
          Positioned(
            left: 3,
            top: 54,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                      // child: const HomeScreen(),
                      child: const AppNavs(),
                      type: PageTransitionType.leftToRightWithFade,
                    ));
              },
              child: Container(
                width: 51,
                height: 51,
                decoration: const ShapeDecoration(
                  color: Color(0xFF252222),
                  shape: OvalBorder(
                    side: BorderSide(width: 2, color: Color(0xFF1C1919)),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            left: 19,
            top: 73,
            child: Text(
              'Go',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 34.94,
            top: 23,
            child: Opacity(
              opacity: 0.50,
              child: Transform(
                transform: Matrix4.identity()
                  ..translate(0.0, 0.0)
                  ..rotateZ(1.56),
                child: Container(
                  width: 12.94,
                  height: 12.94,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Stack(children: []),
                ),
              ),
            ),
          ),
          Positioned(
            left: 34.94,
            top: 31,
            child: Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(1.56),
              child: Container(
                width: 12.94,
                height: 12.94,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: const Stack(children: []),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
