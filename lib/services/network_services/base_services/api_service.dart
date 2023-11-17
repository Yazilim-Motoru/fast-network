import 'package:dio/dio.dart';
import '../../../models/base_model/fast_model.dart';
import '/extension/http_status_extension.dart';
import '../../../enum/fast_http_status.dart';
import '../../../exception/fast_exception.dart';
import '../../../models/network_model/response/bad_response.dart';
import '../../../models/network_model/response/ok_response.dart';

abstract class ApiService {
  final Dio dio = Dio();

  ApiService();

  Future<dynamic> get(String url, {Map<String, dynamic>? headers}) async {
    return _processResponse(() => dio.get(url, options: Options(headers: headers)));
  }

  Future<dynamic> post(String url, FastModel model, {Map<String, dynamic>? headers}) async {
    return _processResponse(() => dio.post(url, data: model.toJson(), options: Options(headers: headers)));
  }

  Future<dynamic> put(String url, FastModel model, {Map<String, dynamic>? headers}) async {
    return _processResponse(() => dio.put(url, data: model.toJson(), options: Options(headers: headers)));
  }

  Future<dynamic> delete(String url, {Map<String, dynamic>? headers}) async {
    return _processResponse(() => dio.delete(url, options: Options(headers: headers)));
  }

  Future<dynamic> _processResponse(Future<Response> Function() requestMethod) async {
    try {
      final response = await requestMethod();
      final statusCode = response.statusCode;

      if (statusCode != null) {
        final status = FastHttpStatus.values.firstWhere(
              (s) => s.code == statusCode,
          orElse: () => FastHttpStatus.internalServerError,
        );

        if (status == FastHttpStatus.ok) {
          return OkResponse(response.data, 'Success', statusCode);
        } else {
          return BadResponse('Error: ${status.name}', statusCode, response.data);
        }
      } else {
        throw BadResponse('No status code received', 0, null);
      }
    } on DioException catch (e, stackTrace) {
      throw FastException(
          message: e.message ?? 'Unknown error',
          statusCode: e.response?.statusCode,
          trace: stackTrace
      );
    }
  }
}
