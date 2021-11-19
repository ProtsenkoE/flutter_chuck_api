import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chuck_api/constants/image_constants.dart';

class JokeWidget extends StatefulWidget {
  final joke;
  final String id;

  const JokeWidget({Key? key, required this.joke, required this.id})
      : super(key: key);

  @override
  State<JokeWidget> createState() => _JokeWidgetState();
}

class _JokeWidgetState extends State<JokeWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _image(),
        _jokeText(),
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
            Navigator.pushNamed(context, '/details/${widget.id}',
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
