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

final List<Festival> festivals = [];
