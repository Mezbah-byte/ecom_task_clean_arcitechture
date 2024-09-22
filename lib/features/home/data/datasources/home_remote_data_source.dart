import 'package:dio/dio.dart';
import 'package:ecom_task/features/home/data/models/product_model.dart';
import 'package:ecom_task/features/home/domain/entities/product.dart';
import 'package:get/get.dart';
import '../../domain/entities/slider.dart';
import '../../domain/entities/category.dart';
import '../models/slider_model.dart'; // Make sure you import the model
import '../models/category_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<Slider>> getSliders();
  Future<List<Category>> getFeaturedCategories();
  Future<List<Product>> getTodaysDeal();
  Future<List<Product>> getFeaturedProduct();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio;

  HomeRemoteDataSourceImpl(this.dio);

  @override
  Future<List<Slider>> getSliders() async {
    try {
      final response =
          await dio.get('https://www.beta.takesell.com.bd/api/v2/sliders');

      // Check if the response contains the 'data' field
      if (response.data['success'] == true && response.data['data'] != null) {
        // Map over the 'data' list and convert it to a List<Slider>
        return (response.data['data'] as List)
            .map((json) => SliderModel.fromJson(json) as Slider)
            .toList();
      } else {
        // Handle the error or empty response case
        throw Exception('Failed to load sliders');
      }
    } catch (error) {
      // Handle the error case
      print('Error occurred: $error');
      return [];
    }
  }

  @override
  Future<List<Category>> getFeaturedCategories() async {
    try {
      final response = await dio
          .get('https://www.beta.takesell.com.bd/api/v2/categories/featured');

      // Check if the response contains the 'data' field
      if (response.data['success'] == true && response.data['data'] != null) {
        // Map over the 'data' list and convert it to a List<Slider>
        return (response.data['data'] as List)
            .map((json) => CategoryModel.fromJson(json) as Category)
            .toList();
      } else {
        // Handle the error or empty response case
        throw Exception('Failed to load Category');
      }
    } catch (error) {
      // Handle the error case
      print('Error occurred: $error');
      return [];
    }
  }

  @override
  Future<List<Product>> getTodaysDeal() async {
    try {
      final response = await dio
          .get('https://www.beta.takesell.com.bd/api/v2/products/todays-deal');
      if (response.data['success'] == true && response.data['data'] != null) {
        return (response.data['data'] as List)
            .map((json) => ProductModel.fromJson(json))
            .toList(); // No casting needed if ProductModel extends Product
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      print('Error occurred: $error');
      return [];
    }
  }

  @override
  Future<List<Product>> getFeaturedProduct() async {
    try {
      final response = await dio
          .get('https://www.beta.takesell.com.bd/api/v2/products/featured');

      if (response.data['success'] == true && response.data['data'] != null) {
        // Return List<ProductModel> as List<Product>
        return (response.data['data'] as List)
            .map((json) => ProductModel.fromJson(json))
            .toList() // This is List<ProductModel>
            .cast<Product>(); // Cast to List<Product>
      } else {
        throw Exception('Failed to load Featured Product');
      }
    } catch (error) {
      print('Error occurred: $error');
      return [];
    }
  }
}
