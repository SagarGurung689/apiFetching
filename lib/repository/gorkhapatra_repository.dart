
import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../model/news_model.dart';
import '../resources/app_urls.dart';

class GorkhapatraRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<List<GorkhaPatra>> getGorkhapatra() async {
    try {
      List<GorkhaPatra> gorkhapatras = [];

      dynamic response =
          await _apiServices.getGetApiResponse(AppUrls.gorkhapatraEndpoint);
      for (var gp in response) {
        GorkhaPatra gorkhapatra = GorkhaPatra.fromJson(gp);
        gorkhapatras.add(gorkhapatra);
      }
      return gorkhapatras;
    } catch (e) {
      throw e;
    }
  }
}
