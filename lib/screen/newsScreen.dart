import 'package:flutter/material.dart';
import 'package:getting_api/changeNotifier/news_provider.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<NewsScreen> {
  final Uri _url = Uri.parse('https://gorkhapatraonline.com/news/58990');

  Future<void> _lunchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var hh = media.height;
    var ww = media.width;
    final newsProvider = Provider.of<NewsProvider>(context);
    return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text('Today News'),
        )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 600,
                width: 400,
                color: Color.fromARGB(255, 244, 239, 239),
                child: Consumer<NewsProvider>(
                  builder: (context, Provider, child) {
                    if (Provider.newsList.isNotEmpty) {
                      return ListView.builder(
                          itemCount: Provider.newsList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: hh * 0.02,
                                ),
                                Container(
                                  color: Colors.amber,
                                  child: Row(
                                    children: [
                                      Expanded(child: SizedBox()),
                                      Expanded(
                                        flex: 5,
                                        child: Text(
                                          Provider.newsList[index].title!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                      Expanded(child: SizedBox()),
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                              Provider.newsList[index].date!)),
                                      Expanded(child: SizedBox()),
                                    ],
                                  ),
                                ),
                                Image(
                                  image: NetworkImage(
                                      Provider.newsList[index].image!),
                                ),
                                Row(
                                  children: [
                                    Expanded(child: SizedBox()),
                                    Expanded(
                                        flex: 10,
                                        child: Text(Provider
                                            .newsList[index].description!)),
                                    Expanded(child: SizedBox())
                                  ],
                                ),
                                SizedBox(
                                  height: hh * 0.1,
                                ),
                                Row(
                                  children: [
                                    Expanded(child: Text('See more news ->')),
                                    Expanded(
                                        child: InkWell(
                                      onTap: _lunchUrl,
                                      child:
                                          Text(Provider.newsList[index].link!),
                                    )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: hh * 0.001,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: hh * 0.04,
                                ),
                              ],
                            );
                          });
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                )

                // ),
                )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => newsProvider.fetchNews(),
            tooltip: 'Refresh',
            child: Icon(Icons.refresh)));
  }
}
