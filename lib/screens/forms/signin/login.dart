import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


import '../signup/signup.dart';
import 'widgets/buttons/google_button.dart';
import 'widgets/buttons/login_button.dart';



class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      decoration:  const InputDecoration(
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
                      decoration:  const InputDecoration(
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
                
 const SizedBox(height: 10,), 
                   
                      TextButton(onPressed: (){}, 
                      child: const Text('Forgot Password?', 
                      
                      style: TextStyle(color: Colors.black),
                      
                      )),
                    
                    // Button. 
                        const SizedBox(height: 30,), 
                    const SignInButton(), 
                    const SizedBox(height: 20,), 
                    const Text('Or Continue With', 
                    style: TextStyle(color: Colors.grey),), 
                    const SizedBox(height: 20,), 

                    // social media button.
                    const GoogleButton(), 
                    const SizedBox(height: 10,), 
                     Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

      const Text('Don\'t have an account?', style: TextStyle(color: Colors.grey),),

      TextButton(onPressed: () {
        Get.to(() => const SignUp());
      },  child: const Text('Sign Up', style: TextStyle(color: Colors.black),))
    ],
  )
                    
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
