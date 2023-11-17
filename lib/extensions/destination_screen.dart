import 'package:flutter/material.dart';

import '../models/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({super.key, required this.destination});

  final Destination destination;
  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0)
                  ]),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white))
                ],
              ),
            )
          ],
        )
      ],
    ));
  }
}
