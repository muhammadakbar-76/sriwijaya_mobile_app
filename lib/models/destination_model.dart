import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  const DestinationModel({
    required this.id,
    this.name = "",
    this.imageUrl = "",
    this.city = "",
    this.rating = 0.0,
    this.price = 0,
    this.reservedSeat = const [],
  });

  final String id;

  final String name;

  final String city;

  final String imageUrl;

  final int price;

  final double rating;

  final List<dynamic> reservedSeat;

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationModel(
        id: id,
        name: json["name"],
        city: json["city"],
        imageUrl: json["imageUrl"],
        rating: json["rating"].toDouble(),
        price: json["price"],
        reservedSeat: json["reservedSeat"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
        "imageUrl": imageUrl,
        "price": price,
        "rating": rating,
        "reservedSeat": reservedSeat,
      };

  @override
  List<Object?> get props =>
      [id, name, city, imageUrl, price, rating, reservedSeat];
}
