import 'package:flutter_chuck_api/data/network_service.dart';
import 'package:flutter_chuck_api/data/store/jokes_store.dart';
import 'package:flutter_chuck_api/domain/repository/repository.dart';
import 'package:flutter_chuck_api/presentation/favorite/bloc/get_favorite_joke/get_favorite_joke_bloc.dart';
import 'package:flutter_chuck_api/presentation/home/bloc/add_favorite_joke/add_favorite_joke_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/store/favourite_store.dart';
import 'presentation/home/bloc/get_jokes/get_jokes_bloc.dart';

Future<void> initDi() async {
  final getIt = GetIt.instance;

  getIt.registerLazySingleton(() => NetworkService('api.chucknorris.io'));
  getIt.registerLazySingleton(() => JokesStore(getIt.get()));
  getIt.registerLazySingleton(() => FavouriteStore());
  getIt.registerLazySingleton(
      () => JokesRepositoryIml(getIt.get(), getIt.get()));
  getIt.registerLazySingleton(() => GetJokesBloc(getIt.get()));
  getIt.registerLazySingleton(
      () => AddFavoriteJokeBloc(getIt.get(), getIt.get()));
  getIt.registerLazySingleton(() => GetFavoriteJokeBloc(getIt.get()));
}
