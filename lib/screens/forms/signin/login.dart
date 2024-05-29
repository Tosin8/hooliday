import 'dart:ffi';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooliday/screens/forms/Auth/controllers/signin_controllers.dart';

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
  final SignInController _controller = Get.put(SignInController());

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
              const SizedBox(
                height: 100,
              ),
              const Text(
                'Hola, \nWelcome Back',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Kindly fill in your details below',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    // Email ID
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: _controller.emailController,
                      validator: _controller.validateEmail,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          prefixIcon: Icon(
                            Iconsax.message,
                            color: Colors.white,
                          ),
                          filled: true,
                          fillColor: Colors.black,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                          ),
                          hintText: 'Email ID',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // Password
                    Obx(() => TextFormField(
                          style: const TextStyle(color: Colors.white),

                          controller: _controller.passwordController,
                          obscureText: _controller.isPasswordHidden.value,
                          validator: _controller.validatePassword,
                          //obscuringCharacter: '',
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.black,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              prefixIcon: Icon(
                                Iconsax.lock,
                                color: Colors.white,
                              ),
                              suffixIcon: IconButton(
                                onPressed: _controller.togglePasswordVisibility,             icon: Icon(_controller.isPasswordHidden.value ?
                                  Iconsax.eye_slash: Iconsax.eye,
                                  color: Colors.white,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey)),
                        )),

                    const SizedBox(
                      height: 10,
                    ),

                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.black),
                        )),

                    // Button.
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: _controller.isLoading.value ? null :  () => _controller.submitForm(_formKey),
                      child: Container(
                        height: 60,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.black),
                        child: _controller.isLoading.value
                            ? const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                        color: Colors.white, strokeWidth: 2.0),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Please Wait',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )
                            : Align(
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Or Continue With',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // social media button.
                    const GoogleButton(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(() => const SignUp());
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.black),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
