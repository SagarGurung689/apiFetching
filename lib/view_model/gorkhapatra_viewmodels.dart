import 'dart:async';

import 'package:flutter/material.dart';
import 'package:getting_api/model/news_model.dart';
import 'package:getting_api/repository/gorkhapatra_repository.dart';

import '../data/response/api_response.dart';



class GorkhapatraViewModel with ChangeNotifier {
  final _gpRepo = GorkhapatraRepository();
  ApiResponse<List<GorkhaPatra>> gorkhapatras = ApiResponse.loading();

  setGorkhapatras(ApiResponse<List<GorkhaPatra>> response) {
    print(response.toString());
    gorkhapatras = response;
    notifyListeners();
  }

  Future<void> fetchGorkhapatra() async {
    setGorkhapatras(ApiResponse.loading());
    print("loading gorkhapatra getting gorkhapatra");

    _gpRepo.getGorkhapatra().then((value) {
      print("sucess getting gorkhapatra");

      setGorkhapatras(ApiResponse.success(value));
    }).onError((error, stackTrace) {
      print("error gorkhapatra getting gorkhapatra");

      setGorkhapatras(ApiResponse.error(error.toString()));
    });
  }
}
