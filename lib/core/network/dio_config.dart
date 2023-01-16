import 'package:dio/dio.dart';

class DioConfig {
   static Dio createRequest(){
    Dio dio= Dio(BaseOptions(
      validateStatus: (int? statusCode){
        if (statusCode != null) {
          if (statusCode >= 100 &&  statusCode<=511) {
            return true;
          } else {
            return false;
          }
        } else {
          return false;
        }
      },
      receiveDataWhenStatusError: true
    ));

    // Time out congifration
    dio.options.connectTimeout=55*1000;
    dio.options.receiveTimeout=55*1000;
    dio.options.sendTimeout=55*1000;
    return dio;
  }
}