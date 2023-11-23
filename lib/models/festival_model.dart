// ignore_for_file: public_member_api_docs, sort_constructors_first
class Festival {
  String imageUrl;
  String name;
  String address;
  int price;
  Festival({
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.price,
  });
}

final List<Festival> festivals = [
  Festival(
      imageUrl: 'assets/images/china_new_year.jpg',
      name: 'China New Year',
      address: 'Beijing, China',
      price: 300),
  Festival(
      imageUrl: 'assets/images/oktober_fest.jpg',
      name: 'Oktober Festival',
      address: 'Munich, Germany',
      price: 420),
  Festival(
      imageUrl: 'assets/images/diwali_fest.jpg',
      name: 'Diwali Festival',
      address: 'New Delhi, India',
      price: 420),
];
