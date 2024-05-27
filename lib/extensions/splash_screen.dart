import 'package:flutter/material.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/splash/2.jpg'), fit: BoxFit.cover)
      ), 
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient
          (colors: [
            Colors.black, 
            Colors.transparent,
         
          ], 
          begin: Alignment.bottomLeft, 
          end: Alignment.topRight)
        )
      ),
      ),
    );
  }
}