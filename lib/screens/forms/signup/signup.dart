import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooliday/screens/forms/Auth/controllers/signup_controllers.dart';
import 'package:hooliday/screens/forms/signin/login.dart';
import 'package:iconsax/iconsax.dart';

import '../signin/widgets/buttons/google_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final SignUpFormController controller = Get.put(SignUpFormController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // bool _isLoading = false; // Add this variable to track loading state

  // String? _validateEmail(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your email';
  //   }
  //    String pattern = r'^[^@]+@[^@]+\.[^@]+';
  //   RegExp regex = RegExp(pattern);
  //   if (!regex.hasMatch(value)) {
  //     return 'Enter a valid email address';
  //   }
  //   return null;
  // }

  // String? _validatePassword(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your password';
  //   }
  //   if (value.length < 6) {
  //     return 'Password must be at least 6 characters long';
  //   }
  //   String pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+=-]).{6,}$';
  //   RegExp regex = RegExp(pattern);
  //   if (!regex.hasMatch(value)) {
  //     return 'Password must contain a letter, number and symbol';
  //   }

  //   return null;
  // }

  // Future<void> _submitForm() async {
  //   if (_formKey.currentState!.validate()) {
  //     setState(() {
  //       _isLoading = true;
  //     });

  //     await Future.delayed(
  //         const Duration(seconds: 2)); // Simulate a delay of 2 seconds

  //     setState(() {
  //       _isLoading = false;
  //     });
  //     Get.to(() => const VerifyScreen()
  //     );
  //     // Perform the sign-in action
  //     // String email = _emailController.text;
  //     // String password = _pwdController.text;

  //     // For demonstration purposes, we'll just show a snackbar with the entered values
  //     // ScaffoldMessenger.of(context).showSnackBar(
  //     //   SnackBar(
  //     //     elevation: 0,
  //     //     behavior: SnackBarBehavior.floating,
  //     //     content: Text('Email: $email\nPassword: $password')),
  //     // );
  //   }
  // }

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
                height: 50,
              ),
              const Text(
                'Hola, \nLet\'s get started',
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
                height: 10,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),

                    // Email ID
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: controller.emailController,
                      validator: controller.validateEmail,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          prefixIcon: Icon(Iconsax.message, color: Colors.white,),
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

                    // first and last name.
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: controller.firstNameController,
                            validator: controller.validateName,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                prefixIcon: Icon(Iconsax.user, color: Colors.white,),
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
                                hintText: 'First Name',
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: controller.lastNameController,
                            validator: controller.validateName,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                prefixIcon: Icon(Iconsax.user, color: Colors.white,),
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
                                hintText: 'Last Name',
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // Password
                    Obx(
                      () => TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: controller.passwordController,
                        obscureText: controller.isPasswordHidden.value,
                        validator: controller.validatePassword,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            prefixIcon: const Icon(Iconsax.lock, color: Colors.white,),
                            suffixIcon: IconButton(
                              icon: Icon(controller.isPasswordHidden.value
                                  ? Iconsax.eye_slash
                                  : Iconsax.eye),
                              onPressed: () {
                                controller.isPasswordHidden.value =
                                    !controller.isPasswordHidden.value;
                              },
                            ),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.grey)),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // Repeat Password
                    Obx(() => TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: controller.confirmPasswordController, 
                      validator: controller.validateConfirmPassword, 
                      
                          obscureText: controller.isConfirmPasswordHidden.value,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            filled: true,
                          fillColor: Colors.black,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              prefixIcon: const Icon(Iconsax.lock, color: Colors.white,),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.isConfirmPasswordHidden.value = !controller.isConfirmPasswordHidden.value;
                                },
                                icon: Icon(controller.isConfirmPasswordHidden.value ? Iconsax.eye_slash : Iconsax.eye)),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              ),
                              hintText: 'Repeat Password',
                              hintStyle: const TextStyle(color: Colors.grey)),
                        )),
                    const SizedBox(
                      height: 20,
                    ),

                    // Phone Number
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: controller.phoneNumberController, 
                      validator: controller.validatePhoneNumber,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        filled: true,
                          fillColor: Colors.black,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          prefixIcon: Icon(Icons.phone, color: Colors.white,),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                          ),
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // Button.
                    const SizedBox(
                      height: 10,
                    ),

                    GestureDetector(
                     // onTap: _isLoading ? null : _submitForm,
                     onTap: controller.signUp, 
                      child: Container(
                        height: 60,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.black),
                       // child: _isLoading
                       child: Obx(() => controller.isLoading.value
                            ? const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                        color: Colors.black, strokeWidth: 2.0),
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
                            : const Align(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                      ),
                    ),
                    ), 
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Or Continue With',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // social media button.
                    const GoogleButton(),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'I have an account?',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(() => const SignIn());
                            },
                            child: const Text(
                              'Sign In',
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
