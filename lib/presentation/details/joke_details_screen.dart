import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_chuck_api/domain/model/models.dart';
import 'package:flutter_chuck_api/presentation/common/constants/constants.dart';

class JokeDetails extends StatelessWidget {
  JokeDetails({Key? key, required this.details}) : super(key: key);

  Joke details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Joke'),
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
      body: SafeArea(
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image(Joke(joke: details.joke, imageUrl: details.imageUrl)),
            _description(Joke(joke: details.joke, imageUrl: details.imageUrl)),
            _backButton(context),
          ],
        )),
      ),
    );
  }

  Container _backButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40.0),
      width: 100.0,
      child: ElevatedButton(
        child: const Center(
          child: Text(
            backButton,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.teal,
          minimumSize: const Size(100.0, 40.0),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Container _image(Joke joke) {
    return Container(
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: joke.imageUrl != ''
              ? NetworkImage(joke.imageUrl)
              : NetworkImage(AllImages().defaultImage),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Container _description(Joke joke) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      child: Text(
        joke.joke,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
