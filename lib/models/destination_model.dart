import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id;
  final String name;
  final String city;
  final String imgUrl;
  final double rating;
  final int price;

  DestinationModel({
    required this.id,
    this.name = '',
    this.city = '',
    this.imgUrl = '',
    this.rating = 0.0,
    this.price = 0,
  });

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) {
    return DestinationModel(
      id: id,
      name: json['name'],
      city: json['city'],
      imgUrl: json['imgUrl'],
      rating: json['rating'].toDouble(),
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'city': city,
        'imgUrl': imgUrl,
        'rating': rating,
        'price': price,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        city,
        imgUrl,
        rating,
        price,
      ];
}
