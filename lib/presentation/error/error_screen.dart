import 'package:flutter/material.dart';
import 'package:flutter_chuck_api/presentation/common/constants/constants.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100.0),
      child: const Text(
        'Error, repeat the query with the keyword',
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.red,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
