import 'package:a_modern_forum_project/observers/scroll_observer.dart';
import 'package:a_modern_forum_project/themes/button_theme.dart';
import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/widgets/tag_selector/tag_selector_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:provider/provider.dart';

/// Allows users to select tags when creating a post
class TagSelector extends StatefulWidget {
  /// Tag selector controller
  final TagSelectorController controller;

  const TagSelector({required this.controller, Key? key}) : super(key: key);

  @override
  _TagSelector createState() => _TagSelector();
}

class _TagSelector extends State<TagSelector> {
  /// Used to show an overlay which provides subforum suggestions
  final FocusNode _focusNode = FocusNode();

  /// Focus node for tag filter search
  final FocusNode _searchFocus = FocusNode();

  /// Scroll controller
  final ScrollController _scrollController = ScrollController();

  /// Tag field search controller
  final TextEditingController _searchController = TextEditingController();

  /// If true, the overlay menu will be open
  bool _isMenuOpen = false;

  /// Used to provide the coordinates of the overlay
  final GlobalKey _buttonKey = GlobalKey();

  /// The width of the overlay
  double _overlayWidth = 300;

  /// Selected tag
  String? _selectedTag;

  /// Tag filter
  String _tagFilter = "";

  @override
  void initState() {
    super.initState();
    _searchFocus.addListener(() {
      final hasFocus = _searchFocus.hasFocus;
      if (!hasFocus) {
        setState(() {
          _isMenuOpen = false;
          _focusNode.unfocus();
        });
      }
    });
    _searchController.addListener(() {
      setState(() {
        _tagFilter = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _searchFocus.dispose();
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<ScrollObserver>().addListener(() {
      RenderObject? renderObject =
          _buttonKey.currentContext?.findRenderObject();
      if (renderObject != null) {
        RenderBox box = renderObject as RenderBox;
        Offset position = box.localToGlobal(Offset.zero);
        if (position.dy < kToolbarHeight) {
          setState(() {
            _overlayWidth = box.size.width;
            _focusNode.unfocus();
          });
        }
      }
    });
    return PortalEntry(
        visible: _isMenuOpen,
        portalAnchor: Alignment.topCenter,
        childAnchor: Alignment.bottomCenter,
        closeDuration: Duration.zero,
        portal: Container(
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            color: AppColourTheme.light,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: Colors.black26),
          ),
          width: _overlayWidth,
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
                      "Select a tag",
                      style: AppTextTheme.body1(context),
                    )),
                    InkWell(
                      onTap: () {
                        _focusNode.unfocus();
                      },
                      child: const Icon(Icons.close_outlined),
                    )
                  ],
                ),
                const Divider(),
                OutlineSearchBar(
                  focusNode: _searchFocus,
                  textEditingController: _searchController,
                  hintText: "Search for a tag",
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Scrollbar(
                  controller: _scrollController,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 30,
                        itemBuilder: (context, index) {
                          String tagName = "Tag $index";
                          return tagName.toLowerCase().contains(_tagFilter)
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
                                      "Tag $index",
                                      style: AppTextTheme.body1(context),
                                    ),
                                  ),
                                  value: tagName,
                                  groupValue: _selectedTag,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedTag = value;
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
            key: _buttonKey,
            focusNode: _focusNode,
            onFocusChange: (hasFocus) {
              setState(() {
                _isMenuOpen = hasFocus || _searchFocus.hasFocus;
                widget.controller.stateChanged(_isMenuOpen);
                _tagFilter = "";
                _searchController.text = "";
              });
            },
            style:
                AppButtonTheme.borderedButtonTheme(context).merge(ButtonStyle(
              backgroundColor: _selectedTag == null
                  ? null
                  : MaterialStateProperty.all<Color>(Colors.green),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Icon(_selectedTag == null
                        ? Icons.bookmark_add_outlined
                        : Icons.bookmark_added_outlined),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      _selectedTag == null ? "Select a tag" : _selectedTag!,
                      style: AppTextTheme.body2(context)?.merge(const TextStyle(
                          color: AppColourTheme.light, height: 1)),
                    ),
                  ],
                ),
                Icon(_isMenuOpen
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
              ],
            ),
            onPressed: () {
              if (_isMenuOpen) {
                _focusNode.unfocus();
              } else {
                _focusNode.requestFocus();
              }
            },
          ),
        ));
  }
}
