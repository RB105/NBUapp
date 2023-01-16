import 'package:currencyapp/data/repository/repository.dart';
import 'package:currencyapp/provider/home_provider.dart';
import 'package:flutter/material.dart';
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
      
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.amber,)),
            const Divider(),
            Expanded(
              flex: 8,
              child: Builder(builder: (context) {
                if (context.watch<HomeProvider>().isLoading) {
                  return const Center(child: CircularProgressIndicator(),);
                }else if(context.watch<HomeProvider>().error.isNotEmpty){
                  String bug=context.watch<HomeProvider>().error;
                  return Center(child: Text(bug.toString()),);
                } else {
                  Box<CurrencyModel> data=RepositoryCurrency.currencyBox!;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                    return ListTile(title: Text(data.getAt(index)!.title.toString()),);
                  },);
                }
              },),
            ),
          ],
        ),
      ),
    );
  }
}
