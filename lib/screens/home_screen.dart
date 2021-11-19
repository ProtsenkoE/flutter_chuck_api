import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_chuck_api/config/api.dart';
import 'package:flutter_chuck_api/constants/string_constants.dart';
import 'package:flutter_chuck_api/model/chuck_joke.dart';
import 'package:flutter_chuck_api/model/jokes_list.dart';
import 'package:flutter_chuck_api/screens/joke_wrapper_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  var chuckJoke = ChuckJoke();
  List<JokesList> listJokes = [];
  final _controller = TextEditingController();

  void getJokeAndUpdateUi() async {
    ChuckJoke jokeData = await Api.getJoke();
    setState(() {
      chuckJoke.imageUrl = jokeData.imageUrl;
      chuckJoke.joke = jokeData.joke;
    });
  }

  void getJokesList(String query) async {
    if (query == '') {
      return;
    }

    List<JokesList> jokesData = await Api.getJokesList(query);

    setState(() {
      listJokes = [];
      isLoading = true;
    });

    Timer(
        const Duration(seconds: 2),
        () => {
              setState(() {
                listJokes = jokesData;
                isLoading = false;
              }),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _searchField(),
              if (listJokes.isEmpty && isLoading == false) _noData(),
              if (listJokes.isEmpty && isLoading == true) _loader(),
              Flexible(
                child: JokeWrapperScreen(listJokes: listJokes),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _loader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(height: 400.0),
        SpinKitSpinningLines(
          size: 50.0,
          color: Colors.teal,
        ),
      ],
    );
  }

  Row _noData() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(height: 400.0),
        Center(
          child: Text(
            noData,
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Roboto',
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  TextField _searchField() {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: searchPlaceholder,
        suffixIcon: IconButton(
          onPressed: () => getJokesList(_controller.text),
          // onPressed: _con
          icon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
