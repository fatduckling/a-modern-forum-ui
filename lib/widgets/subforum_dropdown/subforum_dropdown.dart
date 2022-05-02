import 'package:a_modern_forum_project/observers/scroll_observer.dart';
import 'package:a_modern_forum_project/widgets/text/body1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:provider/provider.dart';

class SubforumDropdown extends StatefulWidget {
  const SubforumDropdown({Key? key}) : super(key: key);

  @override
  _SubforumDropdown createState() => _SubforumDropdown();
}

class _SubforumDropdown extends State<SubforumDropdown> {
  /// Used to show an overlay which provides subforum suggestions
  final FocusNode _focusNode = FocusNode();

  /// If true, the overlay menu will be open
  bool _isMenuOpen = false;

  /// Used to provide the coordinates of the overlay
  final GlobalKey _buttonKey = GlobalKey();

  /// The width of the overlay
  double _overlayWidth = 300;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
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
        portal: Container(
          margin: const EdgeInsets.only(top: 5),
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          width: _overlayWidth,
          // TODO make 100% width on mobiles
          height: 400,
          child: const Center(
            child: TextBody("Hello"),
          ),
        ),
        child: Container(
          height: 40,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 6,
              ),
            ],
          ),
          child: ElevatedButton(
            key: _buttonKey,
            focusNode: _focusNode,
            onFocusChange: (hasFocus) {
              setState(() {
                _isMenuOpen = hasFocus;
              });
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const TextBody("All Subforums"),
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
