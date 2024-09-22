import 'package:dartz/dartz.dart';
import 'package:ecom_task/core/error/failures.dart';
import 'package:ecom_task/core/usecases/usecase.dart';
import 'package:ecom_task/features/authentication/domain/entities/user.dart';
import 'package:ecom_task/features/authentication/domain/repositories/auth_repository.dart';

class Login implements UseCase<User, LoginParams> {
  final AuthRepository repository;

  Login(this.repository);

  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    return await repository.login(params.email, params.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
