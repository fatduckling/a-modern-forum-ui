import 'package:flutter/material.dart';

/// Breadcrumb divider
class BreadcrumbDivider extends StatelessWidget {
  const BreadcrumbDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 65.0 / 180.0,
      child: const SizedBox(
        height: 15,
        width: 20,
        child: Center(
          child: VerticalDivider(
            color: Colors.black26,
          ),
        ),
      ),
    );
  }
}
