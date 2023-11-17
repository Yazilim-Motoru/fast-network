import 'package:dio/dio.dart';
import '../../../exception/fast_exception.dart';

class PutRequest {
  final Dio _dio;

  PutRequest(this._dio);

  Future<Response> putData(String url, dynamic data) async {
    try {
      final response = await _dio.put(url, data: data);
      return response;
    } catch (e, stackTrace) {
      if (e is DioException) {
        throw FastException(
          message: 'Failed to put data: ${e.message}',
          trace: e.stackTrace ?? stackTrace,
        );
      } else {
        throw FastException(
          message: 'Unexpected error: $e',
          trace: stackTrace,
        );
      }
    }
  }
}
