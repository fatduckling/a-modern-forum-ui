import 'dart:math';

import 'package:a_modern_forum_project/observers/scroll_observer.dart';
import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/widgets/icon_with_text/icon_with_text.dart';
import 'package:a_modern_forum_project/widgets/sticky_sidebar/sidebar_panel_template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StickySidebar extends StatefulWidget {
  const StickySidebar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StickySidebar();
}

class _StickySidebar extends State<StickySidebar> {
  /// Used to increase the size of the SizedBox to give a 'sticky' effect
  double _fixedYPositionOffset = 0;

  /// The original Y position of the key widget
  double _originalKeyYPosition = 0;

  /// Floating widget key
  final GlobalKey _floatingWidgetKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      enableStickySidebar();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  color: AppColourTheme.neutralDark.w300,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: SidebarPanelTemplate(
                  title: "Popular Forums",
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                        childAspectRatio: 5 / 4,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) => Material(
                            child: Ink(
                              decoration: const BoxDecoration(
                                  color: AppColourTheme.light),
                              child: InkWell(
                                onTap: () {},
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Image.asset("assets/images/avatar.png"),
                                    Text(
                                      "Subforum $index",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: AppTextTheme.body2bold(context)
                                          ?.apply(color: AppColourTheme.dark),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          IconWithText(
                                              icon:
                                                  Icons.messenger_outline_sharp,
                                              text: "000"),
                                          IconWithText(
                                              icon: Icons.wechat_outlined,
                                              text: "000")
                                        ],
                                      ),
                                    )
                                  ],
                                ), // other widget
                              ),
                            ),
                          )),
                ),
              ))
            ],
          ),
          SizedBox(
            height: _fixedYPositionOffset,
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                key: _floatingWidgetKey,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text("Hello world floater",
                    style: AppTextTheme.body2(context)),
              ))
            ],
          ),
        ],
      ),
    );
  }

  /// Enable the sticky sidebar if it's found
  void enableStickySidebar() {
    /// Set the original key's Y position
    /// Return true if the widget's position is successfully computed, false otherwise
    bool updateOriginalKeyYPosition() {
      RenderObject? renderObject =
          _floatingWidgetKey.currentContext?.findRenderObject();
      bool foundRenderObject = renderObject != null;
      if (foundRenderObject) {
        RenderBox box = renderObject as RenderBox;
        Offset position = box.localToGlobal(Offset.zero);
        double? appBarHeight = Scaffold.of(context).appBarMaxHeight;
        _originalKeyYPosition = position.dy - (appBarHeight ?? 0);
      }
      return foundRenderObject;
    }

    /// If the widget key is found, then set the offset variable according to the scroll position
    if (updateOriginalKeyYPosition()) {
      ScrollObserver scrollObserver =
          Provider.of<ScrollObserver>(context, listen: false);
      scrollObserver.addListener(() {
        if (mounted) {
          setState(() {
            _fixedYPositionOffset = max(
                0, scrollObserver.scrollPosition - _originalKeyYPosition + 5);
          });
        }
      });
    }
  }
}
