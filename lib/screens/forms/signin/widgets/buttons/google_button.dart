import 'package:flutter/material.dart';

class GoogleButton extends StatefulWidget {
  const GoogleButton({super.key});

  @override
  State<GoogleButton> createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector( 
                      onTap: () {
                        
                      },
                      child: Container(
                        height: 60, width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0), 
                          border: Border.all(color: Colors.black)
                        ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Container(
                          width: 20, height: 20,
                          child: Image.asset('assets/icons/google.png')),
                        SizedBox(width: 6,),
                        Text('Google')
                      ],),
                      ),
                    );
                   
  }
}