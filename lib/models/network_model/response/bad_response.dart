class BadResponse {
  final String message;
  final int statusCode;
  final dynamic errorData;

  BadResponse(this.message, this.statusCode, this.errorData);
}
