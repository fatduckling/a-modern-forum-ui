import 'package:a_modern_forum_project/utils/ScreenResizeObserver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  /// Used to show an overlay which provides search suggestions
  final FocusNode _focusNode = FocusNode();

  /// If true, the overlay menu will be open
  bool _isMenuOpen = false;

  /// Used to provide the coordinates of the overlay
  final GlobalKey _searchKey = GlobalKey();

  /// The width of the overlay
  double _overlayWidth = 300;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isMenuOpen = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<ScreenResizeNotifier>().addListener(() {
      RenderObject? renderObject =
          _searchKey.currentContext?.findRenderObject();
      if (renderObject != null) {
        RenderBox box = renderObject as RenderBox;
        setState(() {
          _overlayWidth = box.size.width;
        });
      }
    });
    return PortalEntry(
        visible: _isMenuOpen,
        portalAnchor: Alignment.topCenter,
        childAnchor: Alignment.bottomCenter,
        portal: Material(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: Colors.red,
            child: SizedBox(
              width: _overlayWidth,
              height: 400,
              child: const Center(
                child: Text(
                  "Hello",
                ),
              ),
            )),
        child: OutlineSearchBar(
            key: _searchKey,
            focusNode: _focusNode,
            hintText: "Search",
            onTap: () {
              debugPrint("On tap!");
            },
            onTypingFinished: (s) {
              debugPrint("Typing finished: " + s);
            }));
  }
}
