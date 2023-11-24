import 'package:flutter/material.dart';

import '../../constant.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState?.save();

          // if all is valid , then go to homepage
          Navigator.pushNamed(context, Home.routeName);
        }
      },
      child: Container(
        width: 350,
        height: 55,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Center(
          child: Text(
            'CONTINUE',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class FormError extends StatelessWidget {
  const FormError({
    super.key,
    required this.errors,
  });

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        // SvgPicture.asset('assets/icons/error.svg', height: 14, width: 14),
        const SizedBox(width: 10),
        Text(error),
      ],
    );
  }
}
