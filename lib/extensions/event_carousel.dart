import 'package:flutter/material.dart';

import '../models/hotel_model.dart';

class EventsCarousel extends StatelessWidget {
  const EventsCarousel({super.key});

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
                'Events n Festivals',
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
        const SizedBox(height: 10.0),
        Container(
            // color: Colors.blue,
            height: 300.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hotels.length,
                itemBuilder: (BuildContext context, index) {
                  // Destination destination = destinations[index];
                  Hotel hotel = hotels[index];

                  return Container(
                      margin: const EdgeInsets.all(10),
                      //   color: Colors.red,
                      width: 210,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Positioned(
                            bottom: 15.0,
                            child: Container(
                              height: 120,
                              width: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      hotel.name,
                                      style: const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      hotel.address,
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(height: 2.0),
                                    Text('\$${hotel.price} / Night',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0.0, 2.0),
                                    blurRadius: 6.0,
                                  ),
                                ]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                  image: AssetImage(hotel.imageUrl),
                                  height: 180.0,
                                  width: 220.0,
                                  fit: BoxFit.cover),
                            ),
                          )
                        ],
                      ));
                })),
      ],
    );
  }
}
