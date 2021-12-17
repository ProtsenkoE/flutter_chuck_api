part of 'get_jokes_bloc.dart';

enum JokeStatus { loading, success, noData, failure }

class GetJokesInitial extends Equatable {
  const GetJokesInitial._({
    this.status = JokeStatus.loading,
    this.joke = const Joke(),
  });

  const GetJokesInitial.loading() : this._(status: JokeStatus.loading);

  const GetJokesInitial.failure() : this._(status: JokeStatus.failure);

  const GetJokesInitial.noData() : this._(status: JokeStatus.noData);

  const GetJokesInitial.success(
    List<Joke> joke,
  ) : this._(
          status: JokeStatus.success,
          joke: joke,
        );

  final JokeStatus status;
  final joke;

  @override
  List<Object?> get props => [status, joke];
}
