import 'dart:convert';

import 'package:http/http.dart' as http;

callapi(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var responsebody = json.decode(Utf8Decoder().convert(response.bodyBytes));
    return responsebody;
  } else {
    throw Exception("Unable to fetch data");
  }
}
