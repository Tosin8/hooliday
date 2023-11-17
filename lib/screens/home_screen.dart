import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooliday/extensions/destination_carousel.dart';
import 'package:hooliday/extensions/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;

  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bus,
    FontAwesomeIcons.personBiking,
    FontAwesomeIcons.personWalking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: _selectedIndex == index
                ? Theme.of(context).hintColor
                : const Color(0xffe7ebee),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(
            _icons[index],
            size: 25.0,
            color: _selectedIndex == index
                ? Theme.of(context).primaryColor
                : const Color(0xffb4c1c4),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 120.0),
            child: Text(
              'What would you like to find?',
              style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _icons
                .asMap()
                .entries
                .map(
                  (MapEntry map) => _buildIcon(map.key),
                )
                .toList(),
            //  [
            //   _buildIcon(0),
            //   _buildIcon(1),
            // ], // prefer to use the map feature in case of including another icon inorder to prevent manual insertion.
          ),
          const SizedBox(height: 20),
          const DestinationCarousel(),
          const SizedBox(height: 10),
          const HotelCarousel(),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
      ),
    );
  }
}
