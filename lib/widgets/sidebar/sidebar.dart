import 'package:a_modern_forum_project/widgets/sidebar/popular_forums.dart';
import 'package:a_modern_forum_project/widgets/sidebar/sidebar_home.dart';
import 'package:a_modern_forum_project/widgets/sidebar/useful_links.dart';
import 'package:flutter/material.dart';

/// Sidebar
class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SidebarHome(),
          SizedBox(height: 10),
          PopularForums(),
          SizedBox(height: 10),
          UsefulLinks()
        ],
      ),
    );
  }
}
