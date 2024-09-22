import 'package:ecom_task/features/product_details/domain/entites/product_details.dart';

// class ProductDetailsModel extends ProductDetailsEntity {
//   final String name;
//   final String description;
//
//   ProductDetailsModel({required this.name, required this.description})
//       : super(name: name, description: description);
//
//   factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
//     return ProductDetailsModel(
//       name: json['name'],
//       description: json['description'],
//     );
//   }
// }

class ProductDetailsModel extends ProductDetailsEntity {
  ProductDetailsModel({
    required dynamic id,
    required String name,
    required String addedBy,
    required dynamic sellerId,
    required dynamic shopId,
    required String shopName,
    required String shopLogo,
    required List<Photo> photos, // List<Photo>, not a function
    required String thumbnailImage,
    required List<String> tags,
    required String priceHighLow,
    required bool hasDiscount,
    required String strokedPrice,
    required String mainPrice,
    required double calculablePrice,
    required String currencySymbol,
    required dynamic currentStock,
    required String unit,
    required double rating,
    required dynamic ratingCount,
    required dynamic earnPoint,
    required String description,
    required String videoLink,
    required Brand brand,
    required String link,
  }) : super(
          id: id,
          name: name,
          addedBy: addedBy,
          sellerId: sellerId,
          shopId: shopId,
          shopName: shopName,
          shopLogo: shopLogo,
          photos: photos, // Pass the List<Photo>
          thumbnailImage: thumbnailImage,
          tags: tags,
          priceHighLow: priceHighLow,
          hasDiscount: hasDiscount,
          strokedPrice: strokedPrice,
          mainPrice: mainPrice,
          calculablePrice: calculablePrice,
          currencySymbol: currencySymbol,
          currentStock: currentStock,
          unit: unit,
          rating: rating,
          ratingCount: ratingCount,
          earnPoint: earnPoint,
          description: description,
          videoLink: videoLink,
          brand: brand,
          link: link,
        );

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json['id'],
      name: json['name'],
      addedBy: json['added_by'],
      sellerId: json['seller_id'],
      shopId: json['shop_id'],
      shopName: json['shop_name'],
      shopLogo: json['shop_logo'],
      photos: List<Photo>.from(json['photos'].map((x) => Photo.fromJson(x))),
      thumbnailImage: json['thumbnail_image'],
      tags: List<String>.from(json['tags']),
      priceHighLow: json['price_high_low'],
      hasDiscount: json['has_discount'],
      strokedPrice: json['stroked_price'],
      mainPrice: json['main_price'],
      calculablePrice: (json['calculable_price'] is int)
          ? (json['calculable_price'] as int).toDouble()
          : json['calculable_price'],
      currencySymbol: json['currency_symbol'],
      currentStock: json['current_stock'],
      unit: json['unit'],
      rating: (json['rating'] is int)
          ? (json['rating'] as int).toDouble()
          : json['rating'],
      ratingCount: json['rating_count'],
      earnPoint: json['earn_point'],
      description: json['description'],
      videoLink: json['video_link'] ?? '',
      brand: Brand.fromJson(json['brand']),
      link: json['link'],
    );
  }
}

class Photo {
  String variant;
  String path;

  Photo({
    required this.variant,
    required this.path,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      variant: json['variant'],
      path: json['path'],
    );
  }
}

class Brand {
  int id;
  String name;
  String logo;

  Brand({
    required this.id,
    required this.name,
    required this.logo,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      logo: json['logo'] ?? '',
    );
  }
}
