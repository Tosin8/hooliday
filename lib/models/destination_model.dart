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
    imageUrl: imageUrl, 
    name: name, 
    type: type, 
    startTimes: startTimes, 
    rating: rating, 
    price: price)
];
