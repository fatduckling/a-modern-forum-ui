import 'package:a_modern_forum_project/observers/screen_resize_observer.dart';
import 'package:a_modern_forum_project/observers/scroll_observer.dart';
import 'package:a_modern_forum_project/routes/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:provider/provider.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ScreenResizeObserver>(
          create: (_) => ScreenResizeObserver(),
        ),
        ChangeNotifierProvider<ScrollObserver>(
          create: (_) => ScrollObserver(),
        )
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Portal(
        child: MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xfff0f4f5),
        primaryColor: const Color(0xff087CBF),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xff087CBF),
            ),
        fontFamily: 'lato',
      ),
      title: 'The Modern Forum Project',
      home: const Home(),
    ));
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeRoute();
  }
}
