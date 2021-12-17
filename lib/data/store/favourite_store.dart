import 'dart:convert';

import 'package:flutter_chuck_api/domain/model/joke.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteStore {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String key = 'favourite_list';
  List<Joke> setJokesList = [];
  List<Joke> getJokesList = [];

  Future<List<Joke>> getFavoriteJokes() async {
    final SharedPreferences prefs = await _prefs;

    var getList = prefs.getStringList(key);
    if (getList != null && getList.isNotEmpty) {
      return getList.map((person) => Joke.fromMap(jsonDecode(person))).toList();
    } else {
      return [];
    }
  }

  Future<bool> addToFavoriteJokes(Joke joke) async {
    final SharedPreferences prefs = await _prefs;
    if (setJokesList.isEmpty) {
      setJokesList.add(joke);
    } else {
      final index = setJokesList.indexWhere((element) => element.id == joke.id);
      if (index >= 0) {
        setJokesList.remove(joke);
      } else {
        setJokesList.add(joke);
      }
    }
    List<String> personsEncoded =
        setJokesList.map((joke) => jsonEncode(joke.toMap())).toList();

    return await prefs.setStringList('favourite_list', personsEncoded);
  }
}
