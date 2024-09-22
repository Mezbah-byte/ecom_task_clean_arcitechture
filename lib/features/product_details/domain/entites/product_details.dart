import 'package:ecom_task/features/product_details/data/models/product_details_model.dart';

abstract class ProductDetailsEntity {
  dynamic id;
  String name;
  String addedBy;
  dynamic sellerId;
  dynamic shopId;
  String shopName;
  String shopLogo;
  List<Photo> photos; // Ensure it's a List, not a function
  String thumbnailImage;
  List<String> tags;
  String priceHighLow;
  bool hasDiscount;
  String strokedPrice;
  String mainPrice;
  double calculablePrice;
  String currencySymbol;
  dynamic currentStock;
  String unit;
  double rating;
  dynamic ratingCount;
  dynamic earnPoint;
  String description;
  String videoLink;
  Brand brand;
  String link;

  ProductDetailsEntity({
    required this.id,
    required this.name,
    required this.addedBy,
    required this.sellerId,
    required this.shopId,
    required this.shopName,
    required this.shopLogo,
    required this.photos,
    required this.thumbnailImage,
    required this.tags,
    required this.priceHighLow,
    required this.hasDiscount,
    required this.strokedPrice,
    required this.mainPrice,
    required this.calculablePrice,
    required this.currencySymbol,
    required this.currentStock,
    required this.unit,
    required this.rating,
    required this.ratingCount,
    required this.earnPoint,
    required this.description,
    required this.videoLink,
    required this.brand,
    required this.link,
  });
}
