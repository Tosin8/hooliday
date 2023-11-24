import 'package:flutter/material.dart';

class UserFavs extends StatelessWidget {
  const UserFavs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text('Favorites'),
        ),
        body: Center(
          child: Text('No favorites is available'),
        ));
  }
}
