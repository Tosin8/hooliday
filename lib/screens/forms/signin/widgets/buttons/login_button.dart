import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector( 
                      onTap: () {},
                      child: Container(
                        height: 60, width: 300, 
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.black
                        ),
                        child: const Align(child: Text('Login', style: TextStyle(color: Colors.white, 
                        fontSize: 16),)),
                      ),
                    );
  }
}