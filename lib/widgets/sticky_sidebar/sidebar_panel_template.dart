import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:flutter/material.dart';

/// Used to display a consistent panel in the sidebar
class SidebarPanelTemplate extends StatelessWidget {
  /// Title of the sidebar panel
  final String title;

  /// The widget child displayed in the sidebar panel
  final Widget child;

  const SidebarPanelTemplate(
      {required this.title, required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 7, bottom: 7),
          alignment: Alignment.center,
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          child: Text(
            title,
            style: AppTextTheme.body2bold(context)?.merge(
                const TextStyle(height: 1, color: AppColourTheme.light)),
          ),
        ),
        Flexible(child: child)
      ],
    );
  }
}
