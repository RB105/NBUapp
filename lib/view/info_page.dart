import 'package:currencyapp/data/model/model.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  final CurrencyModel data;
  const InfoPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.blue),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
        ],
      ),
      body: Center(
        child: Container(
          height: size.height * 0.4,
          width: size.width * 0.7,
          decoration:  const BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurStyle: BlurStyle.outer,
                  color: Colors.blue,
                  blurRadius: 50.0,
                  spreadRadius: 40.0,
                ),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                data.title.toString(),
                style: const TextStyle(
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.blue
                      ),
                      Shadow(
                        offset: Offset(0.1, 0.5),
                        blurRadius: 5.0,
                        color: Colors.white
                      ),
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.blueAccent
                      ),
                    ],
                    fontFamily: 'Cinzel',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.cbPrice.toString(),
                    style: const TextStyle(
                       shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.blue
                      ),
                      Shadow(
                        offset: Offset(0.1, 0.5),
                        blurRadius: 5.0,
                        color: Colors.white
                      ),
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.blueAccent
                      ),
                    ],
                      fontFamily: 'Cinzel',
                      fontSize: 70,
                    ),
                  ),
                  const Text(
                    "UZS",
                    style: TextStyle(
                       shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.blue
                      ),
                      Shadow(
                        offset: Offset(0.1, 0.5),
                        blurRadius: 5.0,
                        color: Colors.white
                      ),
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.blueAccent
                      ),
                    ],
                      fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],
              ),
              Text(
                data.date.toString(),
                style: const TextStyle(
                   shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.blue
                      ),
                      Shadow(
                        offset: Offset(0.1, 0.5),
                        blurRadius: 5.0,
                        color: Colors.white
                      ),
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.blueAccent
                      ),
                    ],
                    fontFamily: 'Cinzel',
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
