import 'package:flutter/material.dart';

class OnboardButton extends StatelessWidget {
  const OnboardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector( 
    onTap: () {},
    child: Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)
      ),
    child: const Align(
    child: Text('Explore Now', 
    style: TextStyle(color: Colors.black),),
    ),
    ),
    );
  }
}