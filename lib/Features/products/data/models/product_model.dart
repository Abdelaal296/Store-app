import 'package:store_app/Features/products/data/models/rating_model.dart';

class ProductModel {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final String category;
  final RatingModel? rating;

  ProductModel({
    required this.category,
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(json) {
    return ProductModel(
        category: json['category'],
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        image: json['image'],
        rating: json['rating']==null ? null:RatingModel.fromJson(json['rating']));
  }
}
