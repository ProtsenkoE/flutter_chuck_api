import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_chuck_api/domain/model/models.dart';
import 'package:flutter_chuck_api/domain/repository/repository.dart';
import 'package:meta/meta.dart';

part 'get_jokes_event.dart';
part 'get_jokes_state.dart';

class GetJokesBloc extends Bloc<GetJokesEvent, GetJokesInitial> {
  final JokesRepositoryIml repository;

  GetJokesBloc(this.repository) : super(const GetJokesInitial.loading()) {
    on<LoadJokesEvent>((event, emit) async {
      try {
        final joke = await repository.getJokes(event.query);
        if (joke.isEmpty) {
          emit(const GetJokesInitial.noData());
        } else {
          emit(GetJokesInitial.success(joke));
        }
      } on Exception {
        emit(const GetJokesInitial.failure());
        rethrow;
      }
    });

    add(const LoadJokesEvent('joke'));
  }
}
