import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/compact_subforum/responsive_compact_subforum.dart';
import 'package:a_modern_forum_project/widgets/expanded_subforum/responsive_expanded_subforum.dart';
import 'package:a_modern_forum_project/widgets/scaffold/main_scaffold.dart';
import 'package:a_modern_forum_project/widgets/text/h1.dart';
import 'package:flutter/material.dart';

class ExploreRoute extends StatefulWidget {
  const ExploreRoute({Key? key}) : super(key: key);

  @override
  _ExploreRoute createState() => _ExploreRoute();
}

class _ExploreRoute extends State<ExploreRoute> {
  /// Whether to show the compact view or the expanded view
  bool _isCompact = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData();
    return MainScaffold(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              const Spacer(
                flex: ResponsiveDisplay.pageBoundsFlex,
          ),
              Expanded(
                  flex: 100 - (ResponsiveDisplay.pageBoundsFlex * 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const H1("Forum Explore"),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isCompact = !_isCompact;
                      });
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Ink(
                      // color: Colors.red,
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(_isCompact ? "Compact" : "Expanded"),
                              const SizedBox(
                                width: 10,
                              ),
                              Icon(
                              _isCompact
                                  ? Icons.view_comfortable_outlined
                                  : Icons.view_compact_outlined,
                              size: 40),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          const Spacer(
            flex: ResponsiveDisplay.pageBoundsFlex,
          ),
        ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const Spacer(
                flex: ResponsiveDisplay.pageBoundsFlex,
          ),
              Expanded(
                  flex: 100 - (ResponsiveDisplay.pageBoundsFlex * 2),
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
                              color: Colors.white,
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
                                    collapsedBackgroundColor: Colors.white,
                                    initiallyExpanded: true,
                                    title: Text(
                                      'General Astronomy $index',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: Colors.black),
                                    ),
                                    children: <Widget>[
                                      SizedBox(
                                        height: 10,
                                        child: Container(
                                          color: themeData.scaffoldBackgroundColor,
                                        ),
                                      ),
                                      _isCompact
                                          ? const ResponsiveCompactSubforum()
                                          : const ResponsiveExpandedSubforum(),
                                      SizedBox(
                                        height: 10,
                                        child: Container(
                                          color: themeData.scaffoldBackgroundColor,
                                        ),
                                      ),
                                      _isCompact
                                          ? const ResponsiveCompactSubforum()
                                          : const ResponsiveExpandedSubforum(),
                                      SizedBox(
                                        height: 10,
                                        child: Container(
                                          color: themeData.scaffoldBackgroundColor,
                                        ),
                                      ),
                                      _isCompact
                                          ? const ResponsiveCompactSubforum()
                                          : const ResponsiveExpandedSubforum(),
                                    ],
                                  )),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        );
                      })),
              const Spacer(
                flex: ResponsiveDisplay.pageBoundsFlex,
          ),
            ],
          )
        ]));
  }
}
