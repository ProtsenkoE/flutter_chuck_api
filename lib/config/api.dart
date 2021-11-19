import 'package:flutter_chuck_api/model/chuck_joke.dart';
import 'package:flutter_chuck_api/model/jokes_list.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'environment.dart' as env;
import 'helper.dart';

class Api {
  static Map<String, String> getHeaders() {
    return {"accept": "application/json"};
  }

  static getUrl(String url, Map<String, dynamic> query) {
    return Uri.https(env.apiUrl, url, query);
  }

  static Future<ChuckJoke> getJoke() async {
    var response =
        await http.get(getUrl('/jokes/random', {}), headers: getHeaders());

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return ChuckJoke(
        imageUrl: jsonResponse['icon_url'],
        joke: jsonResponse['value'],
      );
    } else {
      print(response.statusCode);
      return ChuckJoke(
        imageUrl: '',
        joke: '',
      );
    }
  }

  static Future<List<Map<String, dynamic>>> getCategories() async {
    List<Map<String, dynamic>> categories = [];
    var response =
        await http.get(getUrl('/jokes/categories', {}), headers: getHeaders());

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var i = 0; i < jsonResponse.length; ++i) {
        var element = jsonResponse[i];
        categories.add({
          'value': element,
          'label': Helper.capitalize(element),
        });
      }
      return categories;
    } else {
      print(response.statusCode);
      return [];
    }
  }

  static Future<List<JokesList>> getJokesList(String query) async {
    List<JokesList> list = [];
    final queryParameters = {
      'query': query,
    };
    var response = await http.get(getUrl('/jokes/search', queryParameters),
        headers: getHeaders());

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (var i = 0; i < jsonResponse['result'].length; ++i) {
        var element = jsonResponse['result'][i];
        list.add(
          JokesList(
            imageUrl: element['icon_url'],
            joke: element['value'],
          ),
        );
      }
      return list;
    } else {
      print(response.statusCode);
      return [];
    }
  }
}
