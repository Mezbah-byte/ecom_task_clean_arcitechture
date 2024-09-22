class CategoryLinks {
  final String products;
  final String subCategories;

  CategoryLinks({
    required this.products,
    required this.subCategories,
  });

  factory CategoryLinks.fromJson(Map<String, dynamic> json) {
    return CategoryLinks(
      products: json['products'],
      subCategories: json['sub_categories'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products,
      'sub_categories': subCategories,
    };
  }
}

class Category {
  final int id;
  final String name;
  final String banner;
  final String icon;
  final int numberOfChildren;
  final CategoryLinks links;

  Category({
    required this.id,
    required this.name,
    required this.banner,
    required this.icon,
    required this.numberOfChildren,
    required this.links,
  });
}
