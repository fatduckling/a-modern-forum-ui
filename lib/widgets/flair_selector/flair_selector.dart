import 'package:a_modern_forum_project/observers/scroll_observer.dart';
import 'package:a_modern_forum_project/themes/button_theme.dart';
import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/widgets/flair_selector/flair_selector_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:provider/provider.dart';

/// Allows users to select flairs when creating a post
class FlairSelector extends StatefulWidget {
  /// Flair selector controller
  final FlairSelectorController controller;

  const FlairSelector({required this.controller, Key? key}) : super(key: key);

  @override
  _FlairSelector createState() => _FlairSelector();
}

class _FlairSelector extends State<FlairSelector> {
  /// Used to show an overlay which provides subforum suggestions
  final FocusNode focusNode = FocusNode();

  /// Focus node for flair filter search
  final FocusNode searchFocus = FocusNode();

  /// Scroll controller
  final ScrollController scrollController = ScrollController();

  /// Flair field search controller
  final TextEditingController searchController = TextEditingController();

  /// If true, the overlay menu will be open
  bool isMenuOpen = false;

  /// Used to provide the coordinates of the overlay
  final GlobalKey buttonKey = GlobalKey();

  /// The width of the overlay
  double overlayWidth = 300;

  /// Selected flair
  String? selectedFlair;

  /// flair filter
  String flairFilter = "";

  @override
  void initState() {
    super.initState();
    searchFocus.addListener(() {
      final hasFocus = searchFocus.hasFocus;
      if (!hasFocus) {
        setState(() {
          isMenuOpen = false;
          focusNode.unfocus();
        });
      }
    });
    searchController.addListener(() {
      setState(() {
        flairFilter = searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    searchFocus.dispose();
    scrollController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<ScrollObserver>().addListener(() {
      RenderObject? renderObject = buttonKey.currentContext?.findRenderObject();
      if (renderObject != null) {
        RenderBox box = renderObject as RenderBox;
        Offset position = box.localToGlobal(Offset.zero);
        if (position.dy < kToolbarHeight) {
          setState(() {
            overlayWidth = box.size.width;
            focusNode.unfocus();
          });
        }
      }
    });
    return PortalTarget(
        visible: isMenuOpen,
        anchor: const Aligned(
          follower: Alignment.topCenter,
          target: Alignment.bottomCenter,
        ),
        closeDuration: Duration.zero,
        portalFollower: Container(
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            color: AppColourTheme.light,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: AppColourTheme.neutralDark.w50),
          ),
          width: overlayWidth,
          // TODO make 100% width on mobiles
          height: 400,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: Text(
                          "Select a flair",
                      style: AppTextTheme.body1(context),
                    )),
                    InkWell(
                      onTap: () {
                        focusNode.unfocus();
                      },
                      child: const FaIcon(FontAwesomeIcons.xmark),
                    )
                  ],
                ),
                const Divider(),
                OutlineSearchBar(
                  focusNode: searchFocus,
                  textEditingController: searchController,
                  hintText: "Search for a flair",
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Scrollbar(
                      controller: scrollController,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 30,
                        itemBuilder: (context, index) {
                          String flairName = "Flair $index";
                          return flairName.toLowerCase().contains(flairFilter)
                              ? RadioListTile<String>(
                                  contentPadding: EdgeInsets.zero,
                                  title: Container(
                                    transform: Matrix4.translationValues(
                                        -15.0, 0.0, 0.0),
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Color(
                                              (((index + 1) / 30) * 0xFFFFFF)
                                                  .toInt())
                                          .withOpacity(1.0),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Text(
                                      "Flair $index",
                                      style: AppTextTheme.body1(context),
                                    ),
                                  ),
                                  value: flairName,
                                  groupValue: selectedFlair,
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedFlair = value;
                                    });
                                  },
                                )
                              : const SizedBox.shrink();
                        }),
                  ),
                ))
              ],
            ),
          ),
        ),
        child: Container(
          height: 40,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: ElevatedButton(
            key: buttonKey,
            focusNode: focusNode,
            onFocusChange: (hasFocus) {
              setState(() {
                isMenuOpen = hasFocus || searchFocus.hasFocus;
                widget.controller.stateChanged(isMenuOpen);
                flairFilter = "";
                searchController.text = "";
              });
            },
            style:
                AppButtonTheme.borderedButtonTheme(context).merge(ButtonStyle(
              backgroundColor: selectedFlair == null
                  ? null
                  : MaterialStateProperty.all<Color>(Colors.green),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.tag,
                        color: selectedFlair == null
                            ? AppColourTheme.tertiary.w700
                            : AppColourTheme.primary.w900),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      selectedFlair == null ? "Select a flair" : selectedFlair!,
                      style: AppTextTheme.body2(context)?.merge(const TextStyle(
                          color: AppColourTheme.light, height: 1)),
                    ),
                  ],
                ),
                FaIcon(isMenuOpen
                    ? FontAwesomeIcons.angleUp
                    : FontAwesomeIcons.angleDown),
              ],
            ),
            onPressed: () {
              if (isMenuOpen) {
                focusNode.unfocus();
              } else {
                focusNode.requestFocus();
              }
            },
          ),
        ));
  }
}
