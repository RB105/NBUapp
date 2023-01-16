import 'package:dio/dio.dart';

class DioErrorConfig {
  static String catchError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectTimeout:
        return "Connect Timeout";
      case DioErrorType.receiveTimeout:
        return "Receive Timeout";
      case DioErrorType.sendTimeout:
        return "Send Timeout";
      case DioErrorType.other:
        return "No internet connection";
      default:
      return  "Something went wrong";
    }
  }
}
