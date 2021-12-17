import 'package:flutter_chuck_api/domain/model/models.dart';

class JokeMapper {
  static List<Joke> toList(entity) {
    List<Joke> list = [];
    entity.forEach(
      (e) => list.add(
        Joke(
          imageUrl: e['icon_url'],
          joke: e['value'],
          id: e['id'],
        ),
      ),
    );
    return list;
  }
}
