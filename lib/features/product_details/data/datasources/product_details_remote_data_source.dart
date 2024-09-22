import 'package:dio/dio.dart';

abstract class ProductDetailsRemoteDataSource {
  Future<Map<String, dynamic>> getProductDetails(int productId);
}

class ProductDetailsRemoteDataSourceImpl
    implements ProductDetailsRemoteDataSource {
  final Dio dio;

  ProductDetailsRemoteDataSourceImpl({required this.dio});

  @override
  Future<Map<String, dynamic>> getProductDetails(int productId) async {
    final response = await dio.get(
        'https://www.beta.takesell.com.bd/api/v2/products/${productId.toString()}');

    if (response.statusCode == 200 &&
        response.data != null &&
        response.data['data'] != null) {
      return response.data['data'][0]; // Return the product data directly
    } else {
      throw Exception('Failed to load product details');
    }
  }
}
