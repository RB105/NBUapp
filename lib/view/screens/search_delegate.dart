import 'package:currencyapp/data/model/model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../info_page.dart';

class MySearchDelegate extends SearchDelegate {
  final Box<CurrencyModel> box;

  MySearchDelegate({required this.box});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear_rounded))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<CurrencyModel> results = box.values.where((element) {
      return element.title!.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return _listView(results);
  }

  ListView _listView(List<CurrencyModel> results) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPage(data: results[index]),));
          },
          title: Text(results[index].title.toString(),style: const TextStyle(fontFamily: 'Cinzel',fontWeight: FontWeight.bold)),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<CurrencyModel> suggestions = box.values.where((element) {
      return element.title!.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return _listView(suggestions);
  }
}
