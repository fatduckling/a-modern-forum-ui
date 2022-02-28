import 'package:a_modern_forum_project/utils/ScreenResizeObserver.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubforumDropdown extends StatefulWidget {
  const SubforumDropdown({Key? key}) : super(key: key);

  @override
  _SubforumDropdown createState() => _SubforumDropdown();
}

class _SubforumDropdown extends State<SubforumDropdown> {
  /// Used to show an overlay which provides subforum suggestions
  final FocusNode _focusNode = FocusNode();

  /// Displays the overlay under the dropdown button
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

  OverlayEntry createOverlayEntry(BuildContext context) {
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
    _overlayEntry = createOverlayEntry(context);
    context.watch<ScreenResizeNotifier>().addListener(() {
      _focusNode.unfocus();
    });
    return SizedBox(
      height: 40,
      width: 300,
      child: ElevatedButton(
        focusNode: _focusNode,
        onFocusChange: (hasFocus) {
          debugPrint("Has focus: " + hasFocus.toString());
          if (hasFocus) {
            Overlay.of(context)?.insert(_overlayEntry);
          } else {
            _overlayEntry.remove();
          }
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            Text("All Subforums"),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
        onPressed: () {
          if (_focusNode.hasFocus) {
            _focusNode.unfocus();
          } else {
            _focusNode.requestFocus();
          }
        },
      ),
    );
  }
}
