import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../di.dart';
import 'common/bloc/app_bloc_obsever.dart';
import 'common/constants/constants.dart';
import 'common/router/router.dart';

Future<void> main() async {
  await BlocOverrides.runZoned(
    () async {
      RouterFluro.setupRouter();
      WidgetsFlutterBinding.ensureInitialized();
      EquatableConfig.stringify = true;
      await initDi();

      runApp(const MyApp());
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouterFluro.router.generator,
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
