import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooliday/screens/forms/signin/login.dart';
import 'package:hooliday/screens/home_screen.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final codeController1 = TextEditingController();
    final codeController2 = TextEditingController();
    final codeController3 = TextEditingController();
    final codeController4 = TextEditingController();
    final focusNodes = List.generate(4, (index) => FocusNode());

    void verifyCode() async {
      await Future.delayed(const Duration(seconds: 2));

      Get.snackbar('Congratulations', 'Your account has been created', snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 2)); 

      Future.delayed(const Duration(seconds: 2),
       (){Get.offAll(() => const HomeScreen()); 
       });
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Email Verification')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter the 4-digit code sent to your email.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCodeBox(codeController1, focusNodes[0], focusNodes[1]),
                _buildCodeBox(codeController2, focusNodes[1], focusNodes[2]),
                _buildCodeBox(codeController3, focusNodes[2], focusNodes[3]),
                _buildCodeBox(codeController4, focusNodes[3], null),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: verifyCode,
              child: const Text('Verify'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAll(() => SignIn());
              },
              child: const Text('Back to Sign In'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeBox(TextEditingController controller, FocusNode currentFocus, FocusNode? nextFocus) {
    return SizedBox(
      width: 50,
      child: TextFormField(
        controller: controller,
        focusNode: currentFocus,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: '',
        ),
        onChanged: (value) {
          if (value.length == 1 && nextFocus != null) {
            nextFocus.requestFocus();
          } else if (value.isEmpty && currentFocus != null) {
            currentFocus.previousFocus();
          }
        },
      ),
    );
  }
}
