import 'package:flutter/foundation.dart';
import 'package:flutter_chuck_api/data/model/mapper/joke_mapper.dart';
import 'package:flutter_chuck_api/domain/model/joke.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetworkService {
  final String baseUrl;

  NetworkService(this.baseUrl);

  static Map<String, String> getHeaders() {
    return {"accept": "application/json"};
  }

  Future<List<Joke>> getJokes(String query) async {
    final queryParameters = {
      'query': query,
    };

    var url = Uri.https(baseUrl, '/jokes/search', queryParameters);

    var response = await http.get(
      url,
      headers: getHeaders(),
    );

    if (response.statusCode == 200) {
      return JokeMapper.toList(convert.jsonDecode(response.body)['result']);
    } else {
      debugPrint('${response.statusCode}');
      throw Exception(response.statusCode);
    }
  }
}
