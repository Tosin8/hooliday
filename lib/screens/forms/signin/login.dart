import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


import '../signup/signup.dart';
import 'widgets/buttons/google_button.dart';



class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
     String pattern = r'^[^@]+@[^@]+\.[^@]+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform the sign-in action
      String email = _emailController.text;
      String password = _pwdController.text;

      // For demonstration purposes, we'll just show a snackbar with the entered values
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          content: Text('Email: $email\nPassword: $password')),
      );
    }

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FadeInLeft( 
          duration: const Duration(milliseconds: 1000),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, 
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100,), 
                const Text('Hola, \nWelcome Back', 
                style: TextStyle(fontSize: 20, 
                fontWeight: FontWeight.w600),
                ), 
                const SizedBox(height: 10,),
                const Text('Kindly fill in your details below', style: TextStyle(
                  color: Colors.grey, 
                fontSize: 15),), 
                const SizedBox(height: 20,), 
          
          
                Form(
                  key: _formKey, 
                  child: Column(
                    children: [
                      const SizedBox(height: 30,), 
                      // Email ID 
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _emailController, 
                        validator: _validateEmail,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration:  const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Icon(Iconsax.message, color: Colors.white,), 
          filled: true,
          fillColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)), 
                        ),
          
                        hintText: 'Email ID',
                        hintStyle: TextStyle(color: Colors.white)
                        ),
                      ), 
          const SizedBox(height: 20,), 
          
          
                      // Password 
                      TextFormField(
controller: _pwdController,
                        obscureText: true,
                        validator: _validatePassword,
                        //obscuringCharacter: '',
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
                    GestureDetector( 
                      onTap: _submitForm,
                      child: Container(
                        height: 60, width: 300, 
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.black
                        ),
                        child: const Align(child: Text('Login', style: TextStyle(color: Colors.white, 
                        fontSize: 16),)),
                      ),
                    ), 
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
        ),
      )
    );
  }

  @override
  void dispose() {
    _pwdController.dispose();
    _emailController.dispose();
    
    super.dispose();
  }

}


