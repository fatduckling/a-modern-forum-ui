import 'package:a_modern_forum_project/widgets/text/error.dart';
import 'package:flutter/material.dart';

/// Used to display a widget that is not yet supported
/// TODO: delete this widget
class UnhandledWidget extends StatelessWidget {
  /// Identifier of the widget
  final String identifier;

  const UnhandledWidget(this.identifier, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ErrorText("$identifier: Unhandled small/medium screen sizes"));
  }
}
