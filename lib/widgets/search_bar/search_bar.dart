import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late final _overlayEntry = createOverlayEntry();

  @override
  void initState() {
    super.initState();
    debugPrint("Initialised state");
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
    return Focus(
      child: OutlineSearchBar(
          hintText: "Search",
          onTap: () {
            debugPrint("On tap!");
          },
          onTypingFinished: (s) {
            debugPrint("Typing finished: " + s);
          }),
      onFocusChange: (hasFocus) {
        if (hasFocus) {
          Overlay.of(context)?.insert(_overlayEntry);
        } else {
          _overlayEntry.remove();
        }
      },
    );
  }
}
