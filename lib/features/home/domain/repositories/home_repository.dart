import 'package:dartz/dartz.dart';
import 'package:ecom_task/features/home/domain/entities/product.dart';
import '../../../../core/error/failures.dart';
import '../entities/slider.dart';
import '../entities/category.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Slider>>> getSliders();
  Future<Either<Failure, List<Category>>> getFeaturedCategories();
  Future<Either<Failure, List<Product>>> getTodaysDeal();
  Future<Either<Failure, List<Product>>> getFeaturedProduct();
}
