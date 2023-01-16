import 'package:currencyapp/data/repository/repository.dart';
import 'package:currencyapp/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../data/model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => HomeProvider(),
        builder: (context, child) => _scaffold(),
      )
    ]);
  }

  Scaffold _scaffold() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NBU"),
      ),
      body: Builder(builder: (context) {
        if (context.watch<HomeProvider>().isLoading) {
          return const Center(child: CircularProgressIndicator(),);
        } else {
          Box<CurrencyModel> data=RepositoryCurrency.currencyBox!;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
            return ListTile(title: Text(data.getAt(index)!.title.toString()),);
          },);
        }
      },),
    );
  }
}
