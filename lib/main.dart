import 'package:a_modern_forum_project/utils/ScreenResizeObserver.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/appbar/responsive_app_bar.dart';
import 'package:a_modern_forum_project/widgets/featured_posts/responsive_featured_posts.dart';
import 'package:a_modern_forum_project/widgets/sort_filter_threads/responsive_sort_filter_threads.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ScreenResizeNotifier(),
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Welcome to flutter',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        ScreenResizeNotifier counter = context.read<ScreenResizeNotifier>();
        counter.onScreenResized();
      });
      final ScreenSize screenSize =
          ResponsiveDisplay.getScreenSize(constraints);
      return Scaffold(
        drawer: ResponsiveDisplay.isLargeDevice(constraints)
            ? null
            : Drawer(
                child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Text('Drawer Header'),
                    ),
                    ListTile(
                      title: const Text('Item 1'),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: const Text('Item 2'),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                  ],
                )),
            appBar: ResponsiveAppBar(
              screenSize: screenSize,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ResponsiveFeaturedPosts(
                    screenSize: screenSize,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ResponsiveSortFilterThreads(
                    screenSize: screenSize,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
