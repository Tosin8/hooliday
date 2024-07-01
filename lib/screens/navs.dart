import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:hooliday/screens/favorite.dart';
import 'package:hooliday/screens/home_screen.dart';
import 'package:hooliday/screens/profile.dart';
import 'package:hooliday/screens/search.dart';


class NavsScreen extends StatefulWidget {
  const NavsScreen({super.key});

  @override
  State<NavsScreen> createState() => _NavsScreenState();
}

class _NavsScreenState extends State<NavsScreen> {
  @override
  Widget build(BuildContext context) {
     int currentIndex = 0;
  final List<Widget> _children = [
    const HomeScreen(),
    const UserProfile(),
    const UserExplore(),
    const UserFavs()
  ];

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

    return Scaffold(
      body: _children[currentIndex],
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: currentIndex,
        onTap: (index) => changePage,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
        elevation: 8,
        fabLocation: BubbleBottomBarFabLocation.end, //new
        hasNotch: true, //new
        hasInk: true, //new, gives a cute ink effect
        inkColor: Colors.black12, //optional, uses splashColor if not specified
        items: const <BubbleBottomBarItem>[
         BubbleBottomBarItem(
          showBadge: true,
          badge: Text("5"),

            backgroundColor: Colors.red,
            icon: Icon(Icons.home, color: Colors.black),
            activeIcon: Icon(Icons.home, color: Colors.red),
            title: Text("Home"),
          ),
           BubbleBottomBarItem(
            backgroundColor: Colors.deepPurple,
            icon: Icon(Icons.person, color: Colors.black),
            activeIcon: Icon(Icons.person, color: Colors.deepPurple),
            title: Text("Profile"), 
          ),
           BubbleBottomBarItem(
            backgroundColor: Colors.indigo,
            icon: Icon(Icons.search, color: Colors.black),
            activeIcon: Icon(Icons.search, color: Colors.indigo),
            title: Text("Search"),
          ),
           BubbleBottomBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.favorite, color: Colors.black),
            activeIcon: Icon(Icons.favorite, color: Colors.green),
            title: Text("Favorite"),
          ),
        ],
      ),
    );
  }
}

