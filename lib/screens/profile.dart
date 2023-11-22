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
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0.3),
              ], begin: Alignment.bottomRight)),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/profile.jpg'))),
                  )
                ],
              ),
            ))
      ],
    ));
  }
}
