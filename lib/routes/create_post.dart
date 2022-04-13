import 'package:a_modern_forum_project/observers/screen_resize_observer.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/scaffold/main_scaffold.dart';
import 'package:a_modern_forum_project/widgets/subforum_dropdown/subforum_dropdown.dart';
import 'package:a_modern_forum_project/widgets/text/h1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Used to display a thread and its comments
class CreatePostRoute extends StatefulWidget {
  const CreatePostRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreatePostRoute();
}

class _CreatePostRoute extends State<CreatePostRoute>
    with TickerProviderStateMixin {
  /// Selected tab index
  int selectedIndex = 0;

  /// Tab controller
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 4);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        setState(() {
          selectedIndex = tabController.index;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize size = context.watch<ScreenResizeObserver>().screenSize;
    final pageBoundsFlex = ResponsiveDisplay.getPageBoundsFlex(size);
    return MainScaffold(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      const SizedBox(
        height: 50,
      ),
      Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(
              flex: pageBoundsFlex,
            ),
            Expanded(
                flex: 100 - (pageBoundsFlex * 2),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const H1("Create a post"),
                      const SizedBox(
                        height: 30,
                      ),
                      const SubforumDropdown(),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: TabBar(
                          unselectedLabelColor: Colors.black54,
                          labelColor: Colors.black,
                          tabs: const [
                            Tab(
                              text: 'Post',
                              icon: Icon(Icons.text_snippet_outlined),
                            ),
                            Tab(
                              text: 'Image',
                              icon: Icon(Icons.image),
                            ),
                            Tab(
                              text: 'Link',
                              icon: Icon(Icons.link),
                            ),
                            Tab(
                              text: 'Poll',
                              icon: Icon(Icons.poll_outlined),
                            ),
                          ],
                          controller: tabController,
                          indicatorSize: TabBarIndicatorSize.tab,
                        ),
                      ),
                    ])),
            Spacer(
              flex: pageBoundsFlex,
            )
          ]),
      const SizedBox(
        height: 30,
      ),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Spacer(
            flex: pageBoundsFlex,
          ),
          Expanded(
            flex: 100 - (pageBoundsFlex * 2),
            child: Text("Selected: $selectedIndex"),
          ),
          Spacer(
            flex: pageBoundsFlex,
          )
        ],
      ),
    ]));
  }
}
