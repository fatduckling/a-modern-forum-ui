import 'package:a_modern_forum_project/observers/screen_resize_observer.dart';
import 'package:a_modern_forum_project/routes/explore.dart';
import 'package:a_modern_forum_project/routes/home.dart';
import 'package:a_modern_forum_project/utils/text_theme.dart';
import 'package:a_modern_forum_project/widgets/search_bar/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LargeAppBar extends StatelessWidget {
  const LargeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              'Name: $width ${observer.screenSize.name}',
              style: AppTextTheme.h4(context)?.apply(color: Colors.white),
            ))
          ],
        ),
      ),
      title: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: SizedBox(
              height: kToolbarHeight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeRoute()),
                  );
                },
                child: Text(
                  "Home",
                  style:
                      AppTextTheme.body1(context)?.apply(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
                height: kToolbarHeight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ExploreRoute()),
                    );
                  },
                  child: Text(
                    "Explore",
                    style:
                        AppTextTheme.body1(context)?.apply(color: Colors.white),
                  ),
                )),
          ),
          const Expanded(
            flex: 5,
            child: SearchBar(),
          ),
          Expanded(
              flex: 1,
              child: SizedBox(
                  height: kToolbarHeight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: AppTextTheme.body1(context)
                          ?.apply(color: Colors.white),
                    ),
                  ))),
        ],
      ),
    );
  }
}
