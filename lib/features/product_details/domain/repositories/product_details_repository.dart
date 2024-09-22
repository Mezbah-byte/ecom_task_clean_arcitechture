import 'package:dartz/dartz.dart';
import 'package:ecom_task/core/error/failures.dart';
import 'package:ecom_task/features/product_details/domain/entites/product_details.dart';

abstract class ProductDetailsRepository {
  Future<Either<Failure, ProductDetailsEntity>> getProductDetails(
      int productId);
}
