import 'dart:convert';
import 'package:ecom_task/features/home/domain/entities/product.dart'; // Adjust the import as necessary

class ProductModel extends Product {
  final String thumbnailImage;
  final bool hasDiscount;
  final String strokedPrice;
  final String mainPrice;
  final double rating;
  final int sales;
  final String detailsUrl;

  ProductModel({
    required int id,
    required String name,
    required this.thumbnailImage,
    required this.hasDiscount,
    required this.strokedPrice,
    required this.mainPrice,
    required this.rating,
    required this.sales,
    required this.detailsUrl,
  }) : super(
            id: id,
            name: name,
            thumbnailImage: thumbnailImage,
            hasDiscount: hasDiscount,
            strokedPrice: strokedPrice,
            mainPrice: mainPrice,
            rating: rating,
            sales: sales,
            detailsUrl: detailsUrl); // Pass id and name to the superclass

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      thumbnailImage: json['thumbnail_image'],
      hasDiscount: json['has_discount'],
      strokedPrice: json['stroked_price'],
      mainPrice: json['main_price'],
      rating: (json['rating'] ?? 0).toDouble(),
      sales: json['sales'],
      detailsUrl: json['links']['details'],
    );
  }

  static List<ProductModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ProductModel.fromJson(json)).toList();
  }
}
