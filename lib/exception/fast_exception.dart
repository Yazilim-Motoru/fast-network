class FastException implements Exception {
  final String message;
  final int? statusCode;
  final DateTime occurredOn;
  final StackTrace _trace;

  FastException({
    required this.message,
    this.statusCode,
    required StackTrace trace,
  }) : _trace = trace, occurredOn = DateTime.now();

  @override
  String toString() {
    return 'FastException - Status Code: ${statusCode ?? 'Unknown'} - Message: $message - Occurred on: $occurredOn\nTrace: $_trace';
  }
}
