import 'package:a_modern_forum_project/widgets/scaffold/main_scaffold.dart';
import 'package:flutter/material.dart';

class ExploreRoute extends StatelessWidget {
  const ExploreRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainScaffold(
        child: Center(
      child: Text("This is the explore page"),
    ));
  }
}
