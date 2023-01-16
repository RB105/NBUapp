import 'package:currencyapp/core/network/dio_config.dart';
import 'package:currencyapp/core/network/dio_error.config.dart';
import 'package:dio/dio.dart';

import '../../core/constants/project_urls.dart';
import '../model/model.dart';

class GetCurrencyService {
  Future<dynamic> getCurrency() async {
    try {
      Response response =
          await DioConfig.createRequest().get(ProjectUrls.myAPI);
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => CurrencyModel.fromJson(e))
            .toList();
      } else {
        return (response.statusMessage.toString());
      }
    } on DioError catch (e) {
      return DioErrorConfig.catchError(e);
    }
  }
}
