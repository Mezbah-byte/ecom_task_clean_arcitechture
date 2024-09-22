import '../../../../core/network/api_client.dart';

abstract class AuthRemoteDataSource {
  Future<String> login(String email, String password);
  Future<String> signup(String name, String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient client;

  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<String> login(String email, String password) async {
    final response = await client.post(
        'https://www.beta.takesell.com.bd/api/v2/auth/login',
        data: {'email': email, 'password': password});
    return response.data['token'];
  }

  @override
  Future<String> signup(String name, String email, String password) async {
    final response = await client.post(
        'https://www.beta.takesell.com.bd/api/v2/auth/signup',
        data: {'name': name, 'email': email, 'password': password});
    return response.data['token'];
  }
}
