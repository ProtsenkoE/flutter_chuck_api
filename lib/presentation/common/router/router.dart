import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chuck_api/domain/model/joke.dart';
import 'package:flutter_chuck_api/presentation/details/joke_details_screen.dart';
import 'package:flutter_chuck_api/presentation/favorite/favorite_screen.dart';
import 'package:flutter_chuck_api/presentation/main_screen.dart';

class RouterFluro {
  static final FluroRouter router = FluroRouter();

  static final Handler _mainHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const MainScreen());

  static final Handler _detailHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          JokeDetails(details: context?.settings?.arguments as Joke));

  static final Handler _favoriteHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const FavoriteScreen());

  static void setupRouter() {
    router.define(
      '/',
      handler: _mainHandler,
    );
    router.define(
      '/details/:id',
      handler: _detailHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/favorite',
      handler: _favoriteHandler,
      transitionType: TransitionType.fadeIn,
    );
  }
}
