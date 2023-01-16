import 'package:hive/hive.dart';

part 'model.g.dart';


@HiveType(typeId: 0)
class CurrencyModel {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? code;
  @HiveField(2)
  String? cbPrice;
  @HiveField(3)
  String? nbuBuyPrice;
  @HiveField(4)
  String? nbuCellPrice;
  @HiveField(5)
  String? date;

  CurrencyModel(
      {this.title,
      this.code,
      this.cbPrice,
      this.nbuBuyPrice,
      this.nbuCellPrice,
      this.date});

  CurrencyModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    code = json['code'];
    cbPrice = json['cb_price'];
    nbuBuyPrice = json['nbu_buy_price'];
    nbuCellPrice = json['nbu_cell_price'];
    date = json['date'];
  }
}
