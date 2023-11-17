
class BaseResponse<T> {
  final T data;
  final String message;
  final int statusCode;

  BaseResponse({required this.data, required this.message, required this.statusCode});
}
