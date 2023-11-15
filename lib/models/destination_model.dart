// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;
  Destination({
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.description,
    required this.activities,
  });
}

List<Activity> activities = [
  Activity(
      imageUrl: 'assets/images/stmarksbailica.jpg',
      name: 'St. Mark\'s Basilica',
      type: 'Sightseeing Tour',
      startTimes: ['9:00 am', '11:00 am'],
      rating: 5,
      price: 30),
  Activity(
      imageUrl: 'assets/images/gondola.jpg',
      name: 'Walking Tour and Gonadola Ride',
      type: 'Sightseeing Tour',
      startTimes: ['11:00 pm', '1:00 pm'],
      rating: 4,
      price: 210),
  Activity(
      imageUrl: 'assets/images/murano.jpg',
      name: 'Murano and Burano Tour',
      type: 'Sightseeing Tour',
      startTimes: ['12:30 pm', '2:00 pm'],
      rating: 3,
      price: 125),
];

List<Destination> destinations = [];
