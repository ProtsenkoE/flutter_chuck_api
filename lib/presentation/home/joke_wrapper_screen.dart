import 'package:flutter/cupertino.dart';
import 'package:flutter_chuck_api/domain/model/models.dart';
import 'joke_item.dart';

class JokeWrapperScreen extends StatelessWidget {
  JokeWrapperScreen({
    Key? key,
    required this.listJokes,
    required this.isFavoritePage,
  }) : super(key: key);

  final List<Joke> listJokes;
  bool isFavoritePage;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: listJokes.length,
      itemBuilder: (context, index) {
        return JokeItem(joke: listJokes[index], isFavoritePage: isFavoritePage);
      },
    );
  }
}
