import '../../domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({
    required int id,
    required String name,
    required String banner,
    required String icon,
    required int numberOfChildren,
    required CategoryLinks links,
  }) : super(
            id: id,
            name: name,
            banner: banner,
            icon: icon,
            numberOfChildren: numberOfChildren,
            links: links);

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      banner: json['banner'],
      icon: json['icon'] ?? '', // Handle empty icon
      numberOfChildren: json['number_of_children'],
      links: CategoryLinks.fromJson(json['links']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'banner': banner,
      'icon': icon,
      'number_of_children': numberOfChildren,
      'links': links.toJson(),
    };
  }
}
