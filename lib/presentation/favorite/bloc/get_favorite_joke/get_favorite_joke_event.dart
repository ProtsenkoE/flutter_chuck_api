part of 'get_favorite_joke_bloc.dart';

@immutable
abstract class GetFavoriteJokeEvent {
  const GetFavoriteJokeEvent();
}

class GetFavoriteJokesEvent extends GetFavoriteJokeEvent {
  const GetFavoriteJokesEvent();
}
