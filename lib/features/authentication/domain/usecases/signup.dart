import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class Signup implements UseCase<User, SignupParams> {
  final AuthRepository repository;

  Signup(this.repository);

  @override
  Future<Either<Failure, User>> call(SignupParams params) async {
    return await repository.signup(params.name, params.email, params.password);
  }
}

class SignupParams {
  final String name;
  final String email;
  final String password;

  SignupParams(
      {required this.name, required this.email, required this.password});
}
