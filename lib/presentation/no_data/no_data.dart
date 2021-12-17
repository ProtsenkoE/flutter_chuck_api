import 'package:flutter/material.dart';
import 'package:flutter_chuck_api/presentation/common/constants/constants.dart';

class NoDataScreen extends StatelessWidget {
  bool isFavoritePage;

  NoDataScreen({Key? key, required this.isFavoritePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 400.0),
          Center(
            child: Text(
              isFavoritePage ? 'No any favourite Jokes' : noData,
              style: const TextStyle(
                fontSize: 18.0,
                fontFamily: 'Roboto',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
