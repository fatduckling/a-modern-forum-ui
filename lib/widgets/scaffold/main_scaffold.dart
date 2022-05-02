import 'package:a_modern_forum_project/observers/screen_resize_observer.dart';
import 'package:a_modern_forum_project/observers/scroll_observer.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/appbar/responsive_app_bar.dart';
import 'package:a_modern_forum_project/widgets/text/body2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScaffold extends StatelessWidget {
  final Widget _child;

  const MainScaffold({required Widget child, Key? key})
      : _child = child,
        super(key: key);

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
          ResponsiveDisplay.getScreenSizeFromBoxConstraints(constraints);
      return Scaffold(
          drawer: screenSize == ScreenSize.large
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
                      child: TextBody2('Drawer Header'),
                    ),
                    ListTile(
                      title: const TextBody2('Item 1'),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: const TextBody2('Item 2'),
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
              child: _child,
            ),
          ));
    });
  }
}
