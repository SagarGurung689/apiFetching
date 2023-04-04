import 'package:flutter/material.dart';
import 'package:getting_api/data/response/api_response.dart';
import 'package:getting_api/model/news_model.dart';
import 'package:getting_api/repository/gorkhapatra_repository.dart';

class GorkhaPatraViewModel with ChangeNotifier {
  final _gorkhaPatraRepo = GorkhaPatraRepository();
  ApiResponse<List<News>> gorkhapatras = ApiResponse.loading();

  setGorkhapatras(ApiResponse<List<News>> response) {
    print(response.toString());
    gorkhapatras = response;
 
    notifyListeners();
  }

  Future<void> fetchGorkhaPatra() async {
    setGorkhapatras(ApiResponse.loading());
    print("Loading and getting gorkhapatra");

    _gorkhaPatraRepo.getGorkhaPatra().then((value) {
      print("Success getting gorkhapatra");

      setGorkhapatras(ApiResponse.success(value));
    }).onError((error, stackTrace) {
      print("error gorokhaptara getting gorkhapatra");

      setGorkhapatras(ApiResponse.error(error.toString()));
    });
  }
}
