import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/widgets/breadcrumbs/breadcrumb_divider.dart';
import 'package:flutter/material.dart';

/// Displays a breadcrumbs widget
class Breadcrumbs extends StatelessWidget {
  /// Path of the breadcrumbs
  final List<String> paths;

  const Breadcrumbs(this.paths, {Key? key}) : super(key: key);

  List<Widget> buildBreadcrumbs(BuildContext buildContext) {
    List<Widget> breadcrumbs = [];
    int index = 0;
    for (String path in paths) {
      bool isLast = (++index) == paths.length;
      if (isLast) {
        breadcrumbs.add(
          Text(
            path,
            style: AppTextTheme.body2(buildContext)
                ?.merge(const TextStyle(height: 1)),
          ),
        );
      } else {
        breadcrumbs.addAll([
          InkWell(
              child: Text(
                path,
                style: AppTextTheme.body2(buildContext)?.merge(TextStyle(
                    color: Theme.of(buildContext).primaryColor, height: 1)),
              ),
              onTap: () {}),
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
      child: Row(children: [
        Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: buildBreadcrumbs(context))
      ]),
    );
  }
}
