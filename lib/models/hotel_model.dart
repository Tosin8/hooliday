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
      name: 'Hotel 0',
      address: '404 Great Street',
      price: 175),
  Hotel(
      imageUrl: 'assets/images/hotel1.jpg',
      name: 'Hotel 1',
      address: '404 Great Street',
      price: 300),
  Hotel(
      imageUrl: 'assets/images/hotel.j2pg',
      name: 'Hotel 2',
      address: '404 Great Street',
      price: 240),
];
