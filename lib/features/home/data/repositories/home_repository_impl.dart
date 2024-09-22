import 'package:dartz/dartz.dart';
import 'package:ecom_task/features/home/domain/entities/product.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/slider.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Slider>>> getSliders() async {
    try {
      final sliders = await remoteDataSource.getSliders();
      return Right(sliders);
    } catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getFeaturedCategories() async {
    try {
      final categories = await remoteDataSource.getFeaturedCategories();
      return Right(categories);
    } catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getTodaysDeal() async {
    try {
      final products = await remoteDataSource.getTodaysDeal();
      return Right(products);
    } catch (error) {
      print(
          'Error occurred while fetching today\'s deals: $error'); // Log the error
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getFeaturedProduct() async {
    try {
      final products = await remoteDataSource.getFeaturedProduct();
      return Right(products);
    } catch (error) {
      print(
          'Error occurred while fetching featured products: $error'); // Log the error
      return Left(ServerFailure());
    }
  }
}
