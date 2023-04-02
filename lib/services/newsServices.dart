import 'dart:convert';


import 'package:getting_api/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsServices {
  String baseUrl = "https://gorkhapatra.herokuapp.com/";

  Future<List<News>> getData() async {
    var url = Uri.parse(baseUrl);
    var response = await http.get(url);
    List<News> categories = [];
    if (response.statusCode == 200) {
      var jsonString = utf8.decode(response.bodyBytes);
      var json = jsonDecode(jsonString);

      for (var item in json) {
        categories.add(News.fromJson(item));
      }

      return categories;
    } else
      return categories;
  }
}
