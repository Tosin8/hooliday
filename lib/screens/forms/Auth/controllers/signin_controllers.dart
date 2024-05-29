import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../home_screen.dart';

class SignInController extends GetxController {
  var isLoading = false.obs;
  var isPasswordHidden = true.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? validateEmail(String? value) {
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

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    String pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+=-]).{6,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Password must contain a letter, number, and symbol';
    }
    return null;
  }

  Future<void> submitForm(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      await Future.delayed(Duration(seconds: 2)); // Simulating network call

      isLoading.value = false;

      Get.off(() => HomeScreen());
    }
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
