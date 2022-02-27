import 'package:flutter/material.dart';

class SubforumDropdown extends StatefulWidget {
  const SubforumDropdown({Key? key}) : super(key: key);

  @override
  _SubforumDropdown createState() => _SubforumDropdown();
}

class _SubforumDropdown extends State<SubforumDropdown> {
  late final _overlayEntry = createOverlayEntry();

  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();
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
    return SizedBox(
      height: 40,
      width: 300,
      child: ElevatedButton(
        focusNode: myFocusNode,
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
            Icon(Icons.keyboard_arrow_down)
          ],
        ),
        onPressed: () {
          myFocusNode.requestFocus();
        },
      ),
    );
  }
}
