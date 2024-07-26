import 'package:dio/dio.dart';
import 'package:to_do_list_clean_architecture/core/utils/constants.dart';
import 'api_client.dart';

class DioClientImpl implements ApiClient {
  late Dio dio;
  DioClientImpl({
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Map<String, dynamic>? headers,
  }) {
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.BASE_URL,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        headers: headers ?? {'Content-Type': 'application/json'},
      ),
    );
  }

  @override
  Future<Response> get(String path, {Map<String, dynamic>? query}) async {
    return await dio.get(
      path,
      queryParameters: query,
    );
  }
}