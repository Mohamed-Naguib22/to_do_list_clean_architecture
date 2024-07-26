import 'package:dio/dio.dart';

abstract class ApiClient {
  Future<Response> get(String path, {Map<String, dynamic>? query});
}