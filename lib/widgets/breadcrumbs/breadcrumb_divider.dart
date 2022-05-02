import 'package:flutter/material.dart';

/// Breadcrumb divider
class BreadcrumbDivider extends StatelessWidget {
  const BreadcrumbDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 65.0 / 180.0,
      child: Container(
        height: 17,
        width: 20,
        transform: Matrix4.translationValues(3.0, 8.0, 0.0),
        child: const Center(
          child: VerticalDivider(
            color: Colors.black26,
          ),
        ),
      ),
    );
  }
}
