import 'package:dio/dio.dart';
import '../../../exception/fast_exception.dart';

class PostRequest {
  final Dio _dio;

  PostRequest(this._dio);

  Future<Response> postData(String url, dynamic data) async {
    try {
      final response = await _dio.post(url, data: data);
      return response;
    } catch (e, stackTrace) {
      if (e is DioException) {
        throw FastException(
          message: 'Failed to post data: ${e.message}',
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
