import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../data/model/model.dart';
import '../data/repository/repository.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getCurrency();
  }
  RepositoryCurrency repo = RepositoryCurrency();

  bool isLoading = false;
  String error = "";

  void getCurrency() async {
    isLoading = true;
    notifyListeners();
    await repo.getCurrency().then((dynamic response) {
      if (response is Box<CurrencyModel>) {
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
        error = response.toString();
      }
    });
  }
}
