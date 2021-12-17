import 'package:flutter_chuck_api/data/store/favourite_store.dart';
import 'package:flutter_chuck_api/data/store/jokes_store.dart';
import 'package:flutter_chuck_api/domain/model/models.dart';

abstract class JokesRepository {
  Future<List<Joke>> getJokes(String query);
  Future<bool> addToFavoriteJokes(Joke joke);
  Future<List?> getFavoriteJokes();
}

class JokesRepositoryIml implements JokesRepository {
  final JokesStore jokesStore;
  final FavouriteStore favouriteStore;

  JokesRepositoryIml(this.jokesStore, this.favouriteStore);

  @override
  Future<List<Joke>> getJokes(String query) async {
    return await jokesStore.getJokes(query);
  }

  @override
  Future<List?> getFavoriteJokes() async {
    return await favouriteStore.getFavoriteJokes();
  }

  @override
  Future<bool> addToFavoriteJokes(Joke joke) async {
    return await favouriteStore.addToFavoriteJokes(joke);
  }
}
