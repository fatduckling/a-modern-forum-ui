import 'package:a_modern_forum_project/observers/screen_resize_observer.dart';
import 'package:a_modern_forum_project/observers/scroll_observer.dart';
import 'package:a_modern_forum_project/routes/view_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:provider/provider.dart';

void main() {
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
    return const Portal(
        child: MaterialApp(
      title: 'Welcome to flutter',
      home: Home(),
    ));
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewPost(Container(
      color: Colors.blue,
      height: 200,
      child: Text("Hello"),
    ));
  }
}
