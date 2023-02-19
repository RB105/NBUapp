import 'package:currencyapp/core/widgets/loading_widget.dart';
import 'package:currencyapp/data/repository/repository.dart';
import 'package:currencyapp/data/service/service_currency.dart';
import 'package:currencyapp/provider/home_provider.dart';
import 'package:currencyapp/view/info_page.dart';
import 'package:currencyapp/view/screens/search_delegate.dart';
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
                flex: 3,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade900,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: const CircleAvatar(),
                        title: const Text("Welcome Back",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
                        subtitle: const Text("Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                        trailing: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.qr_code_scanner_outlined,color: Colors.grey,size: 30,)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.wallet,color: Colors.grey,size: 30,))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            const Divider(),
            ElevatedButton(
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: MySearchDelegate(
                          box: RepositoryCurrency.currencyBox!));
                },
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 70, vertical: 10),
                    textStyle: const TextStyle(fontSize: 20)),
                child: const Text("Search")),
            Expanded(
              flex: 8,
              child: RefreshIndicator(
                onRefresh: GetCurrencyService().getCurrency,
                child: Builder(
                  builder: (context) {
                    if (context.watch<HomeProvider>().isLoading) {
                      return const Center(
                        child: LoadingWidget(),
                      );
                    } else if (context.watch<HomeProvider>().error.isNotEmpty) {
                      String bug = context.watch<HomeProvider>().error;
                      return Center(
                        child: Text(bug.toString()),
                      );
                    } else {
                      Box<CurrencyModel> data = RepositoryCurrency.currencyBox!;
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPage(data: data.getAt(index)!)));
                              },
                              title: Text(data.getAt(index)!.title.toString(),style: const TextStyle(fontFamily: 'Cinzel',fontWeight: FontWeight.bold)),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
