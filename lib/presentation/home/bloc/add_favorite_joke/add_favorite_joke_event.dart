part of 'add_favorite_joke_bloc.dart';

@immutable
abstract class AddFavoriteJokeEvent {
  const AddFavoriteJokeEvent();
}

class AddToFavoriteEvent extends AddFavoriteJokeEvent {
  final Joke joke;
  const AddToFavoriteEvent(this.joke);
}
