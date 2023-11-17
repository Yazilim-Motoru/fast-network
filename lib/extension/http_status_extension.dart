import '../enum/fast_http_status.dart';

extension FastHttpStatusExtension on FastHttpStatus {
  int get code {
    switch (this) {
      case FastHttpStatus.ok:
        return 200;
      case FastHttpStatus.created:
        return 201;
      case FastHttpStatus.noContent:
        return 204;
      case FastHttpStatus.badRequest:
        return 400;
      case FastHttpStatus.unauthorized:
        return 401;
      case FastHttpStatus.forbidden:
        return 403;
      case FastHttpStatus.notFound:
        return 404;
      case FastHttpStatus.internalServerError:
        return 500;
      default:
        return 0;
    }
  }
}