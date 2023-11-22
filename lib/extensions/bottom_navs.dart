import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/favorite.dart';
import '../screens/home_screen.dart';
import '../screens/profile.dart';
import '../screens/search.dart';

class AppNavs extends StatefulWidget {
  const AppNavs({super.key});

  @override
  State<AppNavs> createState() => _AppNavsState();
}

class _AppNavsState extends State<AppNavs> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const HomeScreen(),
    const UserExplore(),
    const UserFavs(),
    const UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 25.0),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.compass, size: 25.0),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.heart, size: 25.0),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15.0,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
              label: '',
            ),
          ],
        ));
  }
}
