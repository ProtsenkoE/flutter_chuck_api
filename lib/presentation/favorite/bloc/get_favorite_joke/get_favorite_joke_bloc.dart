import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_chuck_api/domain/model/models.dart';
import 'package:flutter_chuck_api/domain/repository/repository.dart';
import 'package:meta/meta.dart';

part 'get_favorite_joke_event.dart';
part 'get_favorite_joke_state.dart';

class GetFavoriteJokeBloc
    extends Bloc<GetFavoriteJokesEvent, GetFavoriteJokeState> {
  final JokesRepositoryIml repository;

  GetFavoriteJokeBloc(this.repository)
      : super(const GetFavoriteJokeState.loading()) {
    on<GetFavoriteJokesEvent>((event, emit) async {
      try {
        final jokes = await repository.getFavoriteJokes() ?? [];

        if (jokes.isEmpty) {
          emit(const GetFavoriteJokeState.noData());
        } else {
          emit(GetFavoriteJokeState.success(jokes));
        }
      } on Exception {
        emit(const GetFavoriteJokeState.failure());
        rethrow;
      }
    });
  }
}
