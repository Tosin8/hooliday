// ignore_for_file: public_member_api_docs, sort_constructors_first
class Activity {
  late String imageUrl;
  String name;
  String type;
  List<String> startTimes;
  int rating;
  int price;

  // the constructor.
  Activity({
    required this.imageUrl,
    required this.name,
    required this.type,
    required this.startTimes,
    required this.rating,
    required this.price,
  });
}
