class Product {
  final int id;
  final String name;
  final String thumbnailImage;
  final bool hasDiscount;
  final String strokedPrice;
  final String mainPrice;
  final double rating;
  final int sales;
  final String detailsUrl;

  Product({
    required this.id,
    required this.name,
    required this.thumbnailImage,
    required this.hasDiscount,
    required this.strokedPrice,
    required this.mainPrice,
    required this.rating,
    required this.sales,
    required this.detailsUrl,
  });
}
