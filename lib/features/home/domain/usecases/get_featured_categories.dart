import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/category.dart';
import '../repositories/home_repository.dart';

class GetFeaturedCategories implements UseCase<List<Category>, NoParams> {
  final HomeRepository repository;

  GetFeaturedCategories(this.repository);

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async {
    return await repository.getFeaturedCategories();
  }
}
