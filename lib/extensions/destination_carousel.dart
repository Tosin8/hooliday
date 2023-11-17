import 'package:flutter/material.dart';
import 'package:hooliday/models/destination_model.dart';

class DestinationCarousel extends StatelessWidget {
  const DestinationCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Top Destinations',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
              GestureDetector(
                onTap: () {
                  print('see all');
                },
                child: Text(
                  'See All',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.0),
        Container(
            color: Colors.blue,
            height: 300.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: destinations.length,
                itemBuilder: (BuildContext context, index) {
                  Destination destination = destinations[index];

                  return Container(
                      margin: const EdgeInsets.all(10),
                      color: Colors.red,
                      width: 210,
                      child: Stack(
                        children: [
                          Container(
                              height: 120, width: 200, color: Colors.white)
                        ],
                      ));
                })),
      ],
    );
  }
}
