import 'package:flutter/material.dart';
import 'package:hooliday/screens/forms/signin/widgets/body.dart';



class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInBody(),
    );
  }
}
