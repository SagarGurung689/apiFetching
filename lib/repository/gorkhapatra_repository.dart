import 'package:getting_api/data/network/base_api_services.dart';
import 'package:getting_api/data/network/network_api_services.dart';
import 'package:getting_api/model/news_model.dart';
import 'package:getting_api/resources/app_urls.dart';

class GorkhaPatraRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<List<News>> getGorkhaPatra() async {
    try {
      List<News> gorkhapatras = [];

      dynamic repsonse =
          await _apiServices.getGetApiResponse(AppUrls.gorkhaPatraEndpoint);

      for (var gp in repsonse) {
        News news = News.fromJson(gp);
        gorkhapatras.add(news);
        print(news);
      }
      return gorkhapatras;
    } catch (e) {
      throw e;
    }
  }
}
