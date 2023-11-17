
import 'package:dio/dio.dart';

class GetRequest {
  final Dio _dio;

  GetRequest(this._dio);

  Future<Response> fetchData(String url) async {
    try {
      final response = await _dio.get(url);
      return response;
    } on DioError catch (e) {
      // Handle DioError (e.g., HTTP error, timeout, etc.)
      throw Exception('Failed to load data: ${e.message}');
    }
  }
}
