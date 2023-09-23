class DestinationModel {
  final String id;
  final String name;
  final String city;
  final String desc;
  final String imageUrl;
  final int price;
  final double rating;
  List<String> photoList;
  List<String> interestList;

  DestinationModel({
    required this.id,
    required this.name,
    required this.city,
    required this.desc,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.photoList,
    required this.interestList,
  });

  

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'city': city,
      'desc': desc,
      'price': price,
      'imageUrl': imageUrl,
      'rating': rating,
      'photoList': photoList,
      'interestList': interestList,
    };
  }

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) {
    return DestinationModel(
      id: id,
      name: json['name'],
      city: json['city'],
      desc: json['desc'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      rating: json['rating'],
      photoList: List<String>.from(json['photoList']),
      interestList: List<String>.from(json['interestList']),
    );
  }
}
