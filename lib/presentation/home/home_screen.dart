import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chuck_api/presentation/common/constants/constants.dart';
import 'package:flutter_chuck_api/presentation/error/error_screen.dart';
import 'package:flutter_chuck_api/presentation/home/bloc/get_jokes/get_jokes_bloc.dart';
import 'package:flutter_chuck_api/presentation/no_data/no_data.dart';
import 'package:flutter_chuck_api/presentation/progress/progress_screen.dart';
import 'package:get_it/get_it.dart';

import 'joke_wrapper_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var getJokeBloc = GetIt.instance.get<GetJokesBloc>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/favorite');
            },
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SearchField(controller: _controller, getJokeBloc: getJokeBloc),
              BlocBuilder<GetJokesBloc, GetJokesInitial>(
                bloc: getJokeBloc,
                builder: (_, state) {
                  switch (state.status) {
                    case JokeStatus.loading:
                      return const ProgressScreen();
                    case JokeStatus.success:
                      return Flexible(
                        child: JokeWrapperScreen(
                          listJokes: state.joke,
                          isFavoritePage: false,
                        ),
                      );
                    case JokeStatus.noData:
                      return NoDataScreen(isFavoritePage: false);
                    case JokeStatus.failure:
                      return const ErrorScreen();
                    default:
                      return NoDataScreen(isFavoritePage: false);
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

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required TextEditingController controller,
    required this.getJokeBloc,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final GetJokesBloc getJokeBloc;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: searchPlaceholder,
        suffixIcon: IconButton(
          onPressed: () => getJokeBloc.add(LoadJokesEvent(_controller.text)),
          icon: const Icon(Icons.search),
          // ),
        ),
      ),
    );
  }
}
