import 'package:a_modern_forum_project/routes/explore.dart';
import 'package:a_modern_forum_project/routes/home.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/search_bar/search_bar.dart';
import 'package:flutter/material.dart';

class LargeAppBar extends StatelessWidget {
  /// height of the app bar for large devices (tablets/desktops)
  static const double appBarHeight = 80;

  const LargeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
        primary: Theme.of(context).colorScheme.onPrimary,
        splashFactory: NoSplash.splashFactory);
    final double width = MediaQuery.of(context).size.width;
    return AppBar(
      toolbarHeight: appBarHeight,
      automaticallyImplyLeading: true,
      leadingWidth: 300,
      leading: Container(
        padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
            Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                    'Forum Name: $width ${ResponsiveDisplay.getScreenSizeFromBuildContext(context).name}')),
          ],
        ),
      ),
      title: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: SizedBox(
              height: appBarHeight,
              child: TextButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeRoute()),
                  );
                },
                child: const Text('Home'),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: appBarHeight,
              child: TextButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExploreRoute()),
                  );
                },
                child: const Text('Explore'),
              ),
            ),
          ),
          const Expanded(
            flex: 5,
            child: SearchBar(),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              height: appBarHeight,
              child: TextButton(
                style: style,
                onPressed: () {},
                child: const Text('Login'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
