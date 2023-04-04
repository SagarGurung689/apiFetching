import 'dart:convert';
import 'dart:io';
import 'package:getting_api/data/app_excpetions.dart';
import 'package:http/http.dart' as http;
import 'base_api_services.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet ');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async{

     dynamic responseJson;
    try {
      http.Response response = await http.post(Uri.parse(url), body: data).timeout(Duration(seconds: 20));
      responseJson = returnResponse(response);
     
    } on SocketException {
      throw FetchDataException('No Internet ');
    }

    return responseJson;

 

  }

  dynamic returnResponse(http.Response response){

    switch(response.statusCode){

      case 200 :
      case 201:
      dynamic jsonData = Utf8Decoder().convert(response.bodyBytes);
      dynamic responseJson = json.decode(jsonData);
      return responseJson;

      case 400:
      throw BadRequestException("Bad Request");

      case 404:
      throw UnauthorizedRequest("Unauthorized Request with status code : ${response.statusCode}");

      default: 
      throw FetchDataException('Error occured while Communication with Server with StatusCode : ${response.statusCode}');



    }

  }
}
