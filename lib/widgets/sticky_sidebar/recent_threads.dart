import 'package:a_modern_forum_project/widgets/sticky_sidebar/sidebar_panel_template.dart';
import 'package:flutter/material.dart';

/// Recent threads panel
class RecentThreads extends StatelessWidget {
  const RecentThreads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SidebarPanelTemplate(
        title: "Recent Threads", child: Text("Hi"));
  }
}
