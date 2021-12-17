part of 'get_favorite_joke_bloc.dart';

enum JokesStatus { loading, success, noData, failure }

class GetFavoriteJokeState extends Equatable {
  const GetFavoriteJokeState._({
    this.status = JokesStatus.loading,
    this.favoriteJoke = const Joke(),
  });

  const GetFavoriteJokeState.loading() : this._(status: JokesStatus.loading);

  const GetFavoriteJokeState.failure() : this._(status: JokesStatus.failure);

  const GetFavoriteJokeState.noData() : this._(status: JokesStatus.noData);

  const GetFavoriteJokeState.success(
    List<dynamic> joke,
  ) : this._(
          status: JokesStatus.success,
          favoriteJoke: joke,
        );

  final JokesStatus status;
  final favoriteJoke;

  @override
  List<Object?> get props => [status, favoriteJoke];
}
