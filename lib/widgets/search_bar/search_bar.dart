import 'package:a_modern_forum_project/utils/ScreenResizeObserver.dart';
import 'package:flutter/material.dart';
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

  /// Displays the overlay under the search bar
  late OverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (_overlayEntry.mounted) {
      _overlayEntry.remove();
    }
    _focusNode.dispose();
    super.dispose();
  }

  OverlayEntry createOverlayEntry() {
    RenderObject? renderObject = context.findRenderObject();
    if (renderObject == null) {
      return OverlayEntry(
        builder: (context) => Container(),
      );
    } else {
      RenderBox renderBox = renderObject as RenderBox;
      var size = renderBox.size;
      var offset = renderBox.localToGlobal(Offset.zero);
      return OverlayEntry(
          builder: (context) => Positioned(
                left: offset.dx,
                top: offset.dy + size.height + 5.0,
                width: size.width,
                child: Material(
                  color: Colors.red,
                  elevation: 4.0,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: const <Widget>[
                      ListTile(
                        title: Text('Test'),
                      ),
                      ListTile(
                        title: Text('Test 2'),
                      )
                    ],
                  ),
                ),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    _overlayEntry = createOverlayEntry();
    context.watch<ScreenResizeNotifier>().addListener(() {
      _focusNode.unfocus();
    });
    return Focus(
        focusNode: _focusNode,
        onFocusChange: (hasFocus) {
          if (hasFocus && !_overlayEntry.mounted) {
            Overlay.of(context)?.insert(
              _overlayEntry,
            );
          } else if (_overlayEntry.mounted) {
            _overlayEntry.remove();
          }
        },
        child: OutlineSearchBar(
            hintText: "Search",
            onTap: () {
              debugPrint("On tap!");
            },
            onTypingFinished: (s) {
              debugPrint("Typing finished: " + s);
            }));
  }
}
