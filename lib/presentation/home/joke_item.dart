import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chuck_api/domain/model/models.dart';
import 'package:flutter_chuck_api/presentation/common/constants/constants.dart';
import 'package:get_it/get_it.dart';

import 'bloc/add_favorite_joke/add_favorite_joke_bloc.dart';

class JokeItem extends StatefulWidget {
  final Joke joke;
  final bool isFavoritePage;

  const JokeItem({Key? key, required this.joke, required this.isFavoritePage})
      : super(key: key);

  @override
  State<JokeItem> createState() => _JokeItemState();
}

class _JokeItemState extends State<JokeItem> {
  var addFavoriteJokeBloc = GetIt.instance.get<AddFavoriteJokeBloc>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _image(),
        _jokeText(),
        IconButton(
          icon: Icon(
            widget.isFavoritePage == true
                ? Icons.favorite
                : Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: () =>
              addFavoriteJokeBloc.add(AddToFavoriteEvent(widget.joke)),
        ),
      ],
    );
  }

  Flexible _jokeText() {
    return Flexible(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/details/${widget.joke.id}',
                arguments: widget.joke);
          },
          child: Text(
            widget.joke.joke,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: const TextStyle(
              fontSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }

  Container _image() {
    return Container(
      margin: const EdgeInsets.all(12.0),
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
          image: widget.joke.imageUrl != ''
              ? NetworkImage(widget.joke.imageUrl)
              : NetworkImage(AllImages().defaultImage),
          fit: BoxFit.contain,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
      ),
    );
  }
}
