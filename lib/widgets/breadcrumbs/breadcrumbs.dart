import 'package:a_modern_forum_project/widgets/breadcrumbs/breadcrumb_divider.dart';
import 'package:a_modern_forum_project/widgets/hyperlink/hyperlink.dart';
import 'package:flutter/material.dart';

/// Displays a breadcrumbs widget
class Breadcrumbs extends StatelessWidget {
  /// Path of the breadcrumbs
  final List<String> paths;

  const Breadcrumbs(this.paths, {Key? key}) : super(key: key);

  List<Widget> buildBreadcrumbs() {
    List<Widget> breadcrumbs = [];
    int index = 0;
    for (String path in paths) {
      bool isLast = (++index) == paths.length;
      if (isLast) {
        breadcrumbs.add(Text(path));
      } else {
        breadcrumbs.addAll([
          Hyperlink(
            text: path,
            onTap: () {},
          ),
          const BreadcrumbDivider()
        ]);
      }
    }
    return breadcrumbs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white),
      padding: const EdgeInsets.all(20),
      child: Row(children: [Wrap(children: buildBreadcrumbs())]),
    );
  }
}
