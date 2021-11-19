import 'package:flutter/cupertino.dart';
import 'package:flutter_chuck_api/model/jokes_list.dart';

import '../widgets/joke_widget.dart';

class JokeWrapperScreen extends StatelessWidget {
  const JokeWrapperScreen({
    Key? key,
    required this.listJokes,
  }) : super(key: key);

  final List<JokesList> listJokes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: listJokes.length,
      itemBuilder: (context, index) {
        var item = listJokes[index];
        return JokeWidget(
          joke: item,
          id: index.toString(),
        );
      },
    );
  }
}
