import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chuck_api/screens/joke_details_screen.dart';

import '../main.dart';

class RouterFluro {
  static final FluroRouter router = FluroRouter();

  static final Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const MyHomePage());

  static final Handler _detailHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          JokeDetails(details: context?.settings?.arguments));

  static void setupRouter() {
    router.define(
      '/',
      handler: _homeHandler,
    );
    router.define(
      '/details/:id',
      handler: _detailHandler,
      transitionType: TransitionType.fadeIn,
    );
  }
}
