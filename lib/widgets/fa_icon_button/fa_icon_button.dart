import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Font Awesome icon button
class FAIconButton extends StatelessWidget {
  /// Icon
  final IconData icon;

  /// Tooltip text
  final String tooltip;

  /// On tap callback
  final VoidCallback onTap;

  /// Icon colour
  final Color? iconColour;

  const FAIconButton(
      {required this.icon,
      required this.tooltip,
      required this.onTap,
      this.iconColour,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: onTap,
          overlayColor: MaterialStateProperty.all<Color>(
              AppColourTheme.primary.w50.withOpacity(0.4)),
          child: Container(
              alignment: Alignment.center,
              width: 32,
              height: 32,
              child: FaIcon(
                icon,
                color: iconColour,
              )),
        ),
      ),
    );
  }
}
