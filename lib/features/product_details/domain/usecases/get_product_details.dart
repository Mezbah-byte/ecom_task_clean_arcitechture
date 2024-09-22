import 'package:dartz/dartz.dart';
import 'package:ecom_task/core/error/failures.dart';
import 'package:ecom_task/core/usecases/usecase.dart';
import 'package:ecom_task/features/product_details/domain/entites/product_details.dart';
import 'package:ecom_task/features/product_details/domain/repositories/product_details_repository.dart';

class GetProductDetails implements UseCase<ProductDetailsEntity, int> {
  final ProductDetailsRepository repository;

  GetProductDetails(this.repository);

  @override
  Future<Either<Failure, ProductDetailsEntity>> call(int productId) async {
    return await repository.getProductDetails(productId);
  }
}
