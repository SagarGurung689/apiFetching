import 'package:flutter/material.dart';
import 'package:getting_api/model/news_model.dart';

import 'package:getting_api/services/newsServices.dart';

class NewsProvider extends ChangeNotifier {
  List<News> _newsList = [];

  List<News> get newsList => _newsList;

  Future<void> fetchNews() async {
    _newsList = await NewsServices().getData();
    notifyListeners();
  }
}
