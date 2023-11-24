import 'package:flutter/material.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 140),
          child: Text(
            'Hooliday',
            style: TextStyle(
              fontSize: 26,
            ),
          ),
        )),
        const Text(
          'Welcome Back',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        formBody(),
      ],
    );
  }
}

class formBody extends StatefulWidget {
  const formBody({super.key});

  @override
  State<formBody> createState() => _formBodyState();
}

class _formBodyState extends State<formBody> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Form(child: Padding(padding: EdgeInsets.symmetric(horizontal: 10)));
  }
}
