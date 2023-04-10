// import 'dart:convert';

// import 'package:getting_api/model/news_model.dart';
// import 'package:http/http.dart' as http;

// class ApiServices {
//   Future<List<News>> getData() async {
//     List<News> allNews = [];
//     String baseUrl = 'https://gorkhapatra.herokuapp.com/';

//     try {
//       var response = await http.get(Uri.parse(baseUrl));

//       var jsonData = json.decode(response.body);

//       for (int i = 0; i < jsonData['data'].length; i++) {
//         News news = News.fromJson(jsonData['data'][i]);

//         allNews.add(news);
//       }
//     } catch (e) {}
//     return allNews;
//   }
// }
