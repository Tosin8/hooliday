// ignore_for_file: public_member_api_docs, sort_constructors_first
class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;

  // creatig the constructor.
  Hotel({
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.price,
  });
}

final List<Hotel> hotels = [];
