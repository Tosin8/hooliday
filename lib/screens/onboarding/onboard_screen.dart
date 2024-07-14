import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:get/get.dart';
import 'package:hooliday/screens/forms/signin/login.dart';
import 'package:hooliday/screens/onboarding/splash_button.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Stack(
        children: [
          ImageSlideshow(
            autoPlayInterval: 10000,
            isLoop: true,
            width: double.infinity, 
            height: double.infinity,
            initialPage: 0,
            children: [
              Image.asset('assets/splash/2.jpg', fit: BoxFit.cover),
                 Image.asset('assets/splash/1.jpg', fit: BoxFit.cover),
                    Image.asset('assets/splash/3.jpg', fit: BoxFit.cover),
            ]),
                   Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient
          (colors: [
            Colors.black, 
            Colors.transparent,
         
          ], 
          begin: Alignment.bottomLeft, 
          end: Alignment.topRight)
        ), 
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            FadeIn(
              duration: const Duration(milliseconds: 1000), 
              curve: Curves.easeIn,
              child: const Text('Hooliday', 
              style: TextStyle(
                color: Colors.white,
                 fontSize: 16, 
                 fontWeight: FontWeight.w500, 
                 letterSpacing: 2.0, 
              ),),
            ), 
            const SizedBox(height: 10,),
            const Divider(
              indent: 50,
              endIndent: 60,
              height: 10,
            ), 
            const SizedBox(height: 10,), 
FadeIn(
  duration: const Duration(milliseconds: 1000), 
  delay: const Duration(milliseconds: 1000), 
  curve: Curves.easeIn,
  
  child: const Text('EXPLORE YOUR \nJOURNEY WITH US', 
  style: TextStyle(
    color: Colors.white, 
    fontSize: 20, 
    wordSpacing: 2.0),
    textAlign: TextAlign.center,
    
    ),
), 
  const SizedBox(height: 10,), 
  const Text('All your vacations destinations are here', style: TextStyle(color: Colors.grey),), 
  const SizedBox(height: 30,), 

  // Button. 
  const OnboardButton(),

  // footer. 
  const SizedBox(height: 18,),
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

      const Text('Already have an account?', style: TextStyle(color: Colors.grey),),

      TextButton(onPressed: () {
        Get.to(() => const SignIn());
      },  child: const Text('Sign In', style: TextStyle(color: Colors.white),))
    ],
  )
          ],
        ),
      ),
      


        ],
      ), 



//       body: Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/splash/2.jpg'), fit: BoxFit.cover)
//       ), 


    );
  }
}