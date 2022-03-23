import 'package:a_modern_forum_project/observers/screen_resize_observer.dart';
import 'package:a_modern_forum_project/routes/explore.dart';
import 'package:a_modern_forum_project/routes/home.dart';
import 'package:a_modern_forum_project/widgets/search_bar/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LargeAppBar extends StatelessWidget {
  const LargeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
        primary: Theme.of(context).colorScheme.onPrimary,
        splashFactory: NoSplash.splashFactory);
    ScreenResizeObserver observer = context.watch<ScreenResizeObserver>();
    final double width = observer.windowWidth;
    return AppBar(
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
            const SizedBox(
              width: 10,
            ),
            Flexible(
                child: Text(
                  'name: $width ${observer.screenSize.name}',
              overflow: TextOverflow.ellipsis,
            ))
          ],
        ),
      ),
      title: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
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
          Expanded(
            flex: 2,
            child: TextButton(
              style: style,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExploreRoute()),
                );
              },
              child: const Text('Explore'),
            ),
          ),
          const Expanded(
            flex: 5,
            child: SearchBar(),
          ),
          Expanded(
              flex: 1,
              child: TextButton(
                style: style,
                onPressed: () {},
                child: const Text('Login'),
              )),
        ],
      ),
    );
  }
}
