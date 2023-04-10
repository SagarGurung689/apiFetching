// import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../data/response/status.dart';
import '../resources/components/gorkhapatra_card.dart';
import '../resources/components/section_header_text.dart';
import '../view_model/gorkhapatra_viewmodels.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<HomeScreen> {
  Future<dynamic>? gorkhaPatra;
  bool isLoading = true;
  bool isdeviceonline = false;
  bool isvacancyready = false;
  int maxFailedLoadAttempts = 3;
  Map<String, List> newsData = Map<String, List>();

  GorkhapatraViewModel gorkhapatraViewModel = GorkhapatraViewModel();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    gorkhapatraViewModel.fetchGorkhapatra();
    getData();

    // _createInterstitialAd();

    super.initState();
  }

  getData() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      setState(() {
        isdeviceonline = true;
      });
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      isdeviceonline = true;
    }

    print("Loaded");
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var hh = media.height;
    var ww = media.width;

    // print("resulit is" + "$isdeviceonline");
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: hh * 0.1,
          ),
          Row(
            children: [
              Expanded(child: SizedBox()),
              Expanded(
                flex: 2,
                child: Text("Gorkha Patra",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              ),
              Expanded(child: SizedBox()),
            ],
          ),
          ChangeNotifierProvider<GorkhapatraViewModel>(
              create: (_) => gorkhapatraViewModel,
              child: Consumer<GorkhapatraViewModel>(
                builder: (context, value, child) {
                  switch (value.gorkhapatras.status) {
                    case Status.LOADING:
                      return Center(
                        child: CircularProgressIndicator(),
                      );

                    case Status.ERROR:
                      return Center(
                        child: Text("Unable to fetch Gorkhapatra"),
                      );

                    case Status.SUCCESS:
                      var gpdata = value.gorkhapatras.data;
                      print(value.gorkhapatras.data!.length);
                      return Expanded(
                          child: PageView.builder(
                        controller: PageController(),
                        itemCount: gpdata!.length,
                        itemBuilder: (context, index) {
                          return GpCard(
                            title: gpdata[index].title,
                            imageurl: gpdata[index].image,
                            link: gpdata[index].link,
                            desscription: gpdata[index].description,
                            gpdate: gpdata[index].date,
                          );
                        },
                      ));

                    default:
                      return Center(
                        child: Text("Unknown error occured"),
                      );
                  }
                },
              )),
        ],
      ),
    );
  }
}
