import 'package:eloudcry/splash_screen.dart';
import 'package:eloudcry/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final GetIt serviceLocator = GetIt.I;
  serviceLocator.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Consumer(
        builder: (context, watch, child) {

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: setLightTheme,
            home: Builder(builder: (BuildContext context) {

              return SplashScreen();
            }),
          );
        }
    );
  }
}
