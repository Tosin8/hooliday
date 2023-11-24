import 'package:flutter/material.dart';
import 'package:hooliday/extensions/forms/signup.dart';

import '../../constant.dart';
import '../forgotpass.dart';
import 'login_widget.dart';

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
        const SizedBox(height: 10),
        const formBody(),
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

  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onSaved: (newValue) => email = newValue!,
                onChanged: (value) {
                  if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                    setState(() {
                      errors.remove(kEmailNullError);
                    });
                  } else if (!emailValidatorRegExp.hasMatch(value) &&
                      errors.contains(kInvalidEmailError)) {
                    setState(() {
                      errors.remove(kInvalidEmailError);
                    });
                  }
                  ;
                  return null;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    errors.add(kEmailNullError);
                    return '';
                  } else if (!emailValidatorRegExp.hasMatch(value)) {
                    errors.add(kInvalidEmailError);
                    return '';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: const BorderSide(color: kTextColor),
                      gapPadding: 10,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: const BorderSide(color: kTextColor),
                      gapPadding: 10,
                    ),
                    suffixIcon: const Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                      child: Icon(Icons.mail),
                    )),
              ),
              const SizedBox(height: 20),
              TextFormField(
                onSaved: (newValue) => password = newValue!,
                onChanged: (value) {
                  if (value.isNotEmpty && errors.contains(kPassNullError)) {
                    setState(() {
                      errors.remove(kPassNullError);
                    });
                  } else if (value.length >= 8 &&
                      errors.contains(kShortPassError)) {
                    setState(() {
                      errors.remove(kShortPassError);
                    });
                  }
                  return null;
                },
                validator: (value) {
                  if (value!.isEmpty && !errors.contains(kPassNullError)) {
                    setState(() {
                      errors.add(kPassNullError);
                    });
                  } else if (value.length < 8 &&
                      !errors.contains(kShortPassError)) {
                    setState(() {
                      errors.add(kShortPassError);
                    });
                  }
                  return null;
                },
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,

                obscureText: true, // turning it into a password key.

                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: const BorderSide(color: kTextColor),
                    gapPadding: 10,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: const BorderSide(color: kTextColor),
                    gapPadding: 10,
                  ),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 20, 20
                        // getProportionateScreenWidth(20),
                        // getProportionateScreenWidth(20),
                        // getProportionateScreenWidth(20),
                        ),
                    child: Icon(Icons.lock

                        // height: getProportionateScreenWidth(18),
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                      value: remember,
                      activeColor: kPrimaryColor,
                      onChanged: (value) {
                        setState(() {
                          remember = value!;
                        });
                      }),
                  const Text('Remember Me'),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ForgotPwd()));
                    },
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                  FormError(errors: errors),
                  SizedBox(height: 20),
                  FormButton(formKey: _formKey),
                  const SizedBox(height: 15),
                  const Divider(),
                  const SizedBox(height: 15),
                  //      Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     SocialCard(
                  //       icon: 'assets/icons/google-icon.svg',
                  //       press: () {},
                  //     ),
                  //     SocialCard(
                  //       icon: 'assets/icons/facebook-2.svg',
                  //       press: () {},
                  //     ),
                  //     SocialCard(
                  //       icon: 'assets/icons/twitter.svg',
                  //       press: () {},
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: const Text(
                          "Sign Up ",
                          style: TextStyle(
                              fontSize: 16,
                              color: kPrimaryColor,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ])));
  }
}
