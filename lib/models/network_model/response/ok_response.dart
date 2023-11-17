import '../../base_model/base_response.dart';

class OkResponse<T> extends BaseResponse<T> {
  OkResponse(T data, String message, int statusCode) : super(data: data, message: message, statusCode: statusCode);
}
