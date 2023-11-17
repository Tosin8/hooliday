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

final List<Hotel> hotels = [
  Hotel(
      imageUrl: 'assets/images/hotel0.jpg',
      name: 'Grand Royal Hotel',
      address: 'Great Street, NJ',
      price: 450),
  Hotel(
      imageUrl: 'assets/images/hotel1.jpg',
      name: 'Queen Hotel',
      address: 'Royal Rd, London',
      price: 300),
  Hotel(
      imageUrl: 'assets/images/hotel2.jpg',
      name: 'Barley Beach Hotel',
      address: 'Midtown Manhattan, NY',
      price: 240),
];
