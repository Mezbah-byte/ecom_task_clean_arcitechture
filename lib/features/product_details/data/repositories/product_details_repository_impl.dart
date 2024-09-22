import 'package:dartz/dartz.dart';
import 'package:ecom_task/core/error/failures.dart';
import 'package:ecom_task/features/product_details/data/datasources/product_details_remote_data_source.dart';
import 'package:ecom_task/features/product_details/data/models/product_details_model.dart';
import 'package:ecom_task/features/product_details/domain/entites/product_details.dart';
import 'package:ecom_task/features/product_details/domain/repositories/product_details_repository.dart';

class ProductDetailsImpl implements ProductDetailsRepository {
  final ProductDetailsRemoteDataSource productDetailsRemoteDataSource;

  ProductDetailsImpl(this.productDetailsRemoteDataSource);

  @override
  Future<Either<Failure, ProductDetailsEntity>> getProductDetails(
      int productId) async {
    try {
      final productData =
          await productDetailsRemoteDataSource.getProductDetails(productId);
      final product = ProductDetailsModel.fromJson(productData);
      return Right(product);
    } catch (error) {
      print(
          "Error fetching product details: $error"); // Add this line for debugging
      return Left(ServerFailure());
    }
  }
}
