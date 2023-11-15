import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bus,
    FontAwesomeIcons.personBiking,
    FontAwesomeIcons.personWalking,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 20.0, right: 120.0),
          child: Text(
            'What would you like to find?',
            style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
          ),
        )
      ],
    )));
  }
}
