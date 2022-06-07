import 'package:a_modern_forum_project/observers/screen_resize_observer.dart';
import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/scaffold/main_scaffold.dart';
import 'package:a_modern_forum_project/widgets/subforum/responsive_subforum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExploreRoute extends StatelessWidget {
  const ExploreRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize size = context.watch<ScreenResizeObserver>().screenSize;
    final pageBoundsFlex = ResponsiveDisplay.getPageBoundsFlex(size);
    final ThemeData themeData = ThemeData();
    return MainScaffold(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      const SizedBox(
        height: 20,
      ),
      Row(
        children: [
          Spacer(
            flex: pageBoundsFlex,
          ),
          Expanded(
              flex: 100 - (pageBoundsFlex * 2),
              child: Text(
                "Forum Explore",
                style: AppTextTheme.h1(context),
              )),
          Spacer(
            flex: pageBoundsFlex,
          ),
        ],
      ),
      const SizedBox(
        height: 30,
      ),
      Row(
        children: [
          Spacer(
            flex: pageBoundsFlex,
          ),
          Expanded(
              flex: 100 - (pageBoundsFlex * 2),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: AppColourTheme.light,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.transparent,
                                  width: 0,
                                  style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(15)),
                          clipBehavior: Clip.antiAlias,
                          margin: EdgeInsets.zero,
                          child: Theme(
                              data: themeData.copyWith(
                                  dividerColor:
                                      themeData.scaffoldBackgroundColor),
                              child: ExpansionTile(
                                collapsedBackgroundColor: AppColourTheme.light,
                                initiallyExpanded: true,
                                title: Text(
                                  "General Astronomy $index",
                                  style: AppTextTheme.h2bold(context),
                                ),
                                children: [
                                  SizedBox(
                                    height: 10,
                                    child: Container(
                                      color: themeData.scaffoldBackgroundColor,
                                    ),
                                  ),
                                  const ResponsiveCompactSubforum(),
                                  SizedBox(
                                    height: 10,
                                    child: Container(
                                      color: themeData.scaffoldBackgroundColor,
                                    ),
                                  ),
                                  const ResponsiveCompactSubforum()
                                ],
                              )),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    );
                  })),
          Spacer(
            flex: pageBoundsFlex,
          ),
        ],
      )
    ]));
  }
}
