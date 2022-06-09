import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:flutter/material.dart';

/// Breadcrumb divider
class BreadcrumbDivider extends StatelessWidget {
  const BreadcrumbDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 65.0 / 180.0,
      child: SizedBox(
        height: 15,
        width: 20,
        child: Center(
          child: VerticalDivider(
            color: AppColourTheme.neutralDark.w50,
          ),
        ),
      ),
    );
  }
}
