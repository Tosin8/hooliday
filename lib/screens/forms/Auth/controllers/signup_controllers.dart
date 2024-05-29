

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooliday/screens/forms/verify.dart';

class SignUpFormController extends GetxController {
  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;
  var isLoading = false.obs; 
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please emter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    String pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+=-]).{6,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Password must contain a letter, number and symbol';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }
  
  bool validateForm() {
  return _formKey.currentState?.validate() ?? false; 
}


Future<void> signUp() async {
  if (Get.find<SignUpFormController>().validateForm()) {
  try {
    var isLoading = false.obs; 
    isLoading.value = true; 
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: Get.find<SignUpFormController>().emailController.text,
      password: Get.find<SignUpFormController>().passwordController.text,
    );
    await userCredential.user?.sendEmailVerification(); 
    Get.to(() => const EmailVerificationScreen());

  } on FirebaseAuthException catch (e) {
    Get.snackbar('Error', e.message ?? 'Unknown error occurred'); 
  } finally {
    var isLoading = false.obs; 
    isLoading.value = false; 
  }
  }
}

}
