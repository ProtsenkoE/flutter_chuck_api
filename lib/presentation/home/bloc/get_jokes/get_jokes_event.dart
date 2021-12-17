part of 'get_jokes_bloc.dart';

@immutable
abstract class GetJokesEvent {
  const GetJokesEvent();
}

class LoadJokesEvent extends GetJokesEvent {
  final String query;
  const LoadJokesEvent(this.query);
}
