import 'package:bloc/bloc.dart';
import 'package:flutter_chuck_api/domain/model/models.dart';
import 'package:flutter_chuck_api/domain/repository/repository.dart';
import 'package:flutter_chuck_api/presentation/favorite/bloc/get_favorite_joke/get_favorite_joke_bloc.dart';
import 'package:meta/meta.dart';

part 'add_favorite_joke_event.dart';
part 'add_favorite_joke_state.dart';

class AddFavoriteJokeBloc
    extends Bloc<AddFavoriteJokeEvent, AddFavoriteJokeState> {
  final JokesRepositoryIml repository;
  final GetFavoriteJokeBloc getFavoriteJokeBloc;

  AddFavoriteJokeBloc(this.repository, this.getFavoriteJokeBloc)
      : super(AddFavoriteJokeState()) {
    on<AddToFavoriteEvent>((event, emit) async {
      try {
        final joke = await repository.addToFavoriteJokes(event.joke);

        if (joke == true) {
          getFavoriteJokeBloc.add(const GetFavoriteJokesEvent());
        }
      } on Exception {
        rethrow;
      }
    });
  }
}
