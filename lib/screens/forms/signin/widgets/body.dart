import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

import 'button.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100,), 
              const Text('Hey, \nWelcome Back', 
              style: TextStyle(fontSize: 20, 
              fontWeight: FontWeight.w600),
              ), 
              const SizedBox(height: 10,),
              const Text('Kindly fill in your details below', style: TextStyle(
                color: Colors.grey, 
              fontSize: 15),), 
              const SizedBox(height: 20,), 
              Form(
                child: Column(
                  children: [
                    const SizedBox(height: 30,), 
                    // Email ID 
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
prefixIcon: Icon(Iconsax.message), 
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)), 
                      ),

                      hintText: 'Email ID',
                      hintStyle: TextStyle(color: Colors.grey)
                      ),
                    ), 
const SizedBox(height: 20,), 


                    // Password 
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
prefixIcon: Icon(Iconsax.lock), 
suffixIcon: Icon(Iconsax.eye_slash),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)), 
                      ),

                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey)
                      ),
                    ), 
                    const SizedBox(height: 50,), 

                    // Button. 
                    SignInButton(), 
                    
                  ],
                ),
              ), 
            ],
          ),
        ),
      )
    );
  }
}