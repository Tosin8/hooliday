import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
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
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_bag,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                    const Text(
                      'Miranda West',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Work hard in silence, let your\n success be the noise,',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )),
          Positioned(
            bottom: -100,
            left: 40,
            child: Card(
              elevation: 30,
              shadowColor: Colors.black,
              child: Container(
                width: 320,
                height: 120,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    ListTile(
                      minLeadingWidth: 5,
                      title: Text('My Address'),
                      leading: Icon(Icons.location_on),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    Divider(height: 4),
                    ListTile(
                      minLeadingWidth: 5,
                      title: Text('Account'),
                      leading: Icon(Icons.person),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -230,
            left: 40,
            child: Card(
              elevation: 30,
              shadowColor: Colors.black,
              child: Container(
                width: 320,
                height: 120,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    ListTile(
                      minLeadingWidth: 5,
                      title: Text('Notifications'),
                      leading: Icon(Icons.notifications_active),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    Divider(height: 4),
                    ListTile(
                      minLeadingWidth: 5,
                      title: Text('Account'),
                      leading: Icon(Icons.person),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
