import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/profile_bkg1.jpg'),
                  fit: BoxFit.cover)),
        )
      ],
    ));
  }
}
