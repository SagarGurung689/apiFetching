import 'package:flutter/material.dart';
import 'package:getting_api/data/response/status.dart';
import 'package:getting_api/resources/components/gorkhapatra_card.dart';
import 'package:getting_api/view_model/gorkhapatra_viewmodels.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GorkhaPatraViewModel gorkhapatraViewModel = GorkhaPatraViewModel();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var hh = media.height;
    var ww = media.width;
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text("Gorkhapatra"),
      )),
      body: Column(children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: hh * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Colors.red,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(child: Text('GorkhaPatra')),
                      ],
                    ),
                    ChangeNotifierProvider<GorkhaPatraViewModel>(
                        create: (_) => gorkhapatraViewModel,
                        child: Consumer<GorkhaPatraViewModel>(
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
                                  controller: PageController(
                                    viewportFraction: 0.9,
                                    initialPage: 1,
                                    keepPage: true,
                                  ),
                                  physics: BouncingScrollPhysics(),
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
              ),
            ),
          ],
        )
      ]),
    );
  }
}
