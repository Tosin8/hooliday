import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

import 'favorite.dart';
import 'home_screen.dart';
import 'profile.dart';
import 'search.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 0;

  final screens = [
    
    HomeScreen(), 
    UserExplore(), 
    UserFavs(), 
  UserProfile(),
  ]; 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: screens[index],
      bottomNavigationBar:
      
      NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.pink, 
          labelTextStyle: WidgetStateProperty.all(TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white))), 
       child:
       NavigationBar(
        height: 80, 
        backgroundColor: Colors.black,
        selectedIndex: index,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        animationDuration: const Duration(seconds: 1),
        onDestinationSelected: (int index) => setState(() => this.index = index),
        destinations: [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(icon: Icon(Iconsax.shopping_cart), label: 'Cart'),
          NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
        ],),), 
    );
  }
}


// home, profile, search , favorites. 