import 'package:a_modern_forum_project/observers/screen_resize_observer.dart';
import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/buttons/normal_button.dart';
import 'package:a_modern_forum_project/widgets/file_upload/file_upload.dart';
import 'package:a_modern_forum_project/widgets/poll_editor/poll_editor.dart';
import 'package:a_modern_forum_project/widgets/rich_text_field/rich_text_field.dart';
import 'package:a_modern_forum_project/widgets/scaffold/main_scaffold.dart';
import 'package:a_modern_forum_project/widgets/subforum_dropdown/subforum_dropdown.dart';
import 'package:a_modern_forum_project/widgets/tag_selector/tag_selector.dart';
import 'package:a_modern_forum_project/widgets/tag_selector/tag_selector_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

/// Used to display a thread and its comments
class CreatePostRoute extends StatefulWidget {
  const CreatePostRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreatePostRoute();
}

class _CreatePostRoute extends State<CreatePostRoute>
    with TickerProviderStateMixin {
  /// Tag selector controller
  final TagSelectorController tagSelectorController = TagSelectorController();

  /// Selected tab index
  int selectedIndex = 0;

  /// Tab controller
  late TabController tabController;

  /// Title controller
  final TextEditingController titleController = TextEditingController();

  /// Post title
  String title = "";

  /// Page white space at the bottom
  double pageWhiteSpace = 40;

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
    titleController.addListener(() {
      setState(() {
        title = titleController.text;
      });
    });
    tagSelectorController.addListener((bool isMenuOpen) {
      setState(() {
        pageWhiteSpace = isMenuOpen ? TagSelectorController.height - 50 : 40;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    titleController.dispose();
    tagSelectorController.dispose();
    super.dispose();
  }

  Widget tabWidget() {
    switch (selectedIndex) {
      case 1:
        return const FileUpload();
      case 2:
        return const TextField(
          keyboardType: TextInputType.multiline,
          minLines: 2,
          maxLines: null,
          decoration:
              InputDecoration(border: OutlineInputBorder(), hintText: 'Url'),
        );
      case 3:
        return const PollEditor();
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize size = context.watch<ScreenResizeObserver>().screenSize;
    final pageBoundsFlex = ResponsiveDisplay.getPageBoundsFlex(size);
    return MainScaffold(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      const SizedBox(
        height: 20,
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
                      Text(
                        "Create a post",
                        style: AppTextTheme.h1(context),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const SubforumDropdown(),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: AppColourTheme.light,
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
                              icon: FaIcon(FontAwesomeIcons.fileLines),
                            ),
                            Tab(
                              text: 'Image',
                              icon: FaIcon(FontAwesomeIcons.image),
                            ),
                            Tab(
                              text: 'Link',
                              icon: FaIcon(FontAwesomeIcons.paperclip),
                            ),
                            Tab(
                              text: 'Poll',
                              icon: FaIcon(FontAwesomeIcons.chartLine),
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
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColourTheme.light,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'Title',
                            suffixText: "${title.length}/300"),
                      ),
                      SizedBox(
                        height: selectedIndex > 0 ? 20 : 0,
                      ),
                      tabWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      RichTextField(),
                      const SizedBox(
                        height: 10,
                      ),
                      TagSelector(controller: tagSelectorController),
                      const SizedBox(
                        height: 10,
                      ),
                      const NormalButton(
                        text: "Create Post",
                        borderRadius: 15,
                      )
                    ],
                  ),
                ),
              )),
          Spacer(
            flex: pageBoundsFlex,
          )
        ],
      ),
      SizedBox(
        height: pageWhiteSpace,
      ),
    ]));
  }
}
