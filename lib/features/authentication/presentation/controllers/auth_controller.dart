import 'package:ecom_task/features/authentication/domain/usecases/login.dart';
import 'package:ecom_task/features/authentication/domain/usecases/signup.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Login loginUseCase;
  final Signup signupUseCase;

  AuthController({required this.loginUseCase, required this.signupUseCase});

  var isLoggedIn = false.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  void login(String email, String password) async {
    isLoading.value = true;
    errorMessage.value = '';
    final result =
        await loginUseCase(LoginParams(email: email, password: password));
    isLoading.value = false;
    result.fold(
      (failure) => errorMessage.value = 'Login failed',
      (user) => isLoggedIn.value = true,
    );
  }

  void signup(String name, String email, String password) async {
    isLoading.value = true;
    errorMessage.value = '';
    final result = await signupUseCase(
        SignupParams(name: name, email: email, password: password));
    isLoading.value = false;
    result.fold(
      (failure) => errorMessage.value = 'Signup failed $failure',
      (user) => isLoggedIn.value = true,
    );
    print(errorMessage.toString());
  }
}
