import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/activity_model.dart';
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
              child: Hero(
                tag: widget.destination.imageUrl,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                        image: AssetImage(widget.destination.imageUrl),
                        fit: BoxFit.cover)),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
                  SizedBox(width: 30),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.search, size: 30, color: Colors.white),
                      ),
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.sort, size: 30),
                          color: Colors.white),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              left: 20.0,
              bottom: 20.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.destination.city,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2),
                  ),
                  Row(
                    children: [
                      const Icon(FontAwesomeIcons.locationArrow,
                          size: 20.0, color: Colors.white),
                      const SizedBox(width: 5),
                      Text(
                        widget.destination.country,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
                right: 20.0,
                bottom: 20.0,
                child:
                    Icon(Icons.location_on, color: Colors.white70, size: 25.0))
          ],
        ),
        Expanded(
          child: ListView.builder(
              itemCount: widget.destination.activities.length,
              itemBuilder: (BuildContext context, int index) {
                Activity activity = widget.destination.activities[index];
                return Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                      height: 170.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(activity.name),
                              Text('\$${activity.price}')
                            ],
                          ),
                          Text(activity.type),
                          // _buildRatingStars(activity.rating),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Container(
                                width: 70.0,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).hintColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text(activity.startTimes[0]),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                );
              }),
        )
      ],
    ));
  }
}
