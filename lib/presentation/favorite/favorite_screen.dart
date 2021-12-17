import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chuck_api/presentation/error/error_screen.dart';
import 'package:flutter_chuck_api/presentation/home/joke_wrapper_screen.dart';
import 'package:flutter_chuck_api/presentation/no_data/no_data.dart';
import 'package:flutter_chuck_api/presentation/progress/progress_screen.dart';
import 'package:get_it/get_it.dart';

import 'bloc/get_favorite_joke/get_favorite_joke_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  var getFavoriteJokeBloc = GetIt.instance.get<GetFavoriteJokeBloc>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback(
        (_) => getFavoriteJokeBloc.add(const GetFavoriteJokesEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Jokes'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              BlocBuilder<GetFavoriteJokeBloc, GetFavoriteJokeState>(
                bloc: getFavoriteJokeBloc,
                builder: (_, state) {
                  switch (state.status) {
                    case JokesStatus.loading:
                      return const ProgressScreen();
                    case JokesStatus.success:
                      return Flexible(
                        child: JokeWrapperScreen(
                            listJokes: state.favoriteJoke,
                            isFavoritePage: true),
                      );
                    case JokesStatus.noData:
                      return NoDataScreen(isFavoritePage: true);
                    case JokesStatus.failure:
                      return const ErrorScreen();
                    default:
                      return NoDataScreen(isFavoritePage: true);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
