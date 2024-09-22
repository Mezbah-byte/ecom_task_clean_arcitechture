import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/slider.dart';
import '../repositories/home_repository.dart';

class GetSliders implements UseCase<List<Slider>, NoParams> {
  final HomeRepository repository;

  GetSliders(this.repository);

  @override
  Future<Either<Failure, List<Slider>>> call(NoParams params) async {
    return await repository.getSliders();
  }
}
