import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hooliday',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Fleur De Leah'),
            )
          ],
        ),
      ),
    ));
  }
}
