import 'package:flutter/material.dart';

class SignInButton extends StatefulWidget {
  const SignInButton({super.key});

  @override
  State<SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  final _emailController = TextEditingController();
  final _pwdController = TextEditingController(); 

  @override
  void dispose() {
    _pwdController.dispose();
    _emailController.dispose();
    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector( 
                      onTap: () {
                          if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'Hello ${_emailController.text}\nYour details have been submitted and an email sent to ${_emailController.text}.')));
                      } else {
                        // The form has some validation errors.
                        // Do Something...
                      }
                      },
                      child: Container(
                        height: 60, width: 300, 
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.black
                        ),
                        child: const Align(child: Text('Login', style: TextStyle(color: Colors.white, 
                        fontSize: 16),)),
                      ),
                    );
  }
}