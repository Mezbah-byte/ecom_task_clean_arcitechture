import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient(this.dio);

  Future<Response> post(String url, {Map<String, dynamic>? data}) async {
    return await dio.post(url, data: data);
  }

  Future<Response> get(String url) async {
    return await dio.get(url);
  }
}
