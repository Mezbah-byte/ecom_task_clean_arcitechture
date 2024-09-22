import 'package:dartz/dartz.dart';
import 'package:ecom_task/core/error/failures.dart';
import 'package:ecom_task/core/usecases/usecase.dart';
import 'package:ecom_task/features/home/domain/entities/product.dart';
import 'package:ecom_task/features/home/domain/repositories/home_repository.dart';

class GetTodaysDeal implements UseCase<List<Product>, NoParams> {
  final HomeRepository repository;

  GetTodaysDeal(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async {
    return await repository.getTodaysDeal();
  }
}
