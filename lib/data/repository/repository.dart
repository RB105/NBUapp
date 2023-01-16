import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../model/model.dart';
import '../service/service_currency.dart';

class RepositoryCurrency {
  //for  Comfort
  GetCurrencyService getCurrencyService = GetCurrencyService();

  // for local db
  static Box<CurrencyModel>? currencyBox;

  Future<dynamic> getCurrency() async {
    // hire order function
    return await getCurrencyService
        .getCurrency()
        .then((dynamic response) async {
      if (response is List<CurrencyModel>) {
        await openBox();
        await putToBox(response);
        return currencyBox;
      } else {
        return response.toString();
      }
    });
  }

  Future<void> openBox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    currencyBox = await Hive.openBox<CurrencyModel>("currency");
  }

  Future<void> putToBox(List<CurrencyModel> data) async {
    await currencyBox!.clear();
    for (CurrencyModel element in data) {
      await currencyBox!.add(element);
    }
  }

  void registerAdapter() {
    Hive.registerAdapter(CurrencyModelAdapter());
  }
}
