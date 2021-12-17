import 'package:flutter_chuck_api/data/network_service.dart';
import 'package:flutter_chuck_api/domain/model/joke.dart';

class JokesStore {
  final NetworkService networkService;

  JokesStore(this.networkService);

  Future<List<Joke>> getJokes(String query) async {
    return await networkService.getJokes(query);
  }
}
