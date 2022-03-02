import 'package:a_modern_forum_project/observers/screen_resize_observer.dart';
import 'package:a_modern_forum_project/observers/scroll_observer.dart';
import 'package:a_modern_forum_project/thread_view/thread_view.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/appbar/responsive_app_bar.dart';
import 'package:a_modern_forum_project/widgets/featured_posts/responsive_featured_posts.dart';
import 'package:a_modern_forum_project/widgets/sort_filter_threads/responsive_sort_filter_threads.dart';
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
        child: const MaterialApp(
          title: 'Welcome to flutter',
          home: Home(),
        ));
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        double windowWidth = constraints.maxWidth;
        double windowHeight = constraints.maxHeight;
        ScreenResizeObserver screenResizeObserver =
            context.read<ScreenResizeObserver>();
        screenResizeObserver.onScreenResized(windowWidth, windowHeight);
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
              body: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification is ScrollUpdateNotification) {
                    ScrollObserver observer = context.read<ScrollObserver>();
                    observer.onScroll(notification.metrics.pixels);
                    return false;
                  }
                  return true;
                },
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  ResponsiveFeaturedPosts(screenSize),
                  const SizedBox(
                    height: 50,
                  ),
                  ResponsiveSortFilterThreads(screenSize),
                  const SizedBox(
                    height: 50,
                  ),
                  ThreadView(screenSize)
                ],
                  ),
                ),
              ));
        });
  }
}
