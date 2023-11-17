import 'package:dio/dio.dart';
import '../../../exception/fast_exception.dart';

class DeleteRequest {
  final Dio _dio;

  DeleteRequest(this._dio);

  Future<Response> deleteData(String url) async {
    try {
      final response = await _dio.delete(url);
      return response;
    } catch (e, stackTrace) {
      if (e is DioException) {
        throw FastException(
          message: 'Failed to delete data: ${e.message}',
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
