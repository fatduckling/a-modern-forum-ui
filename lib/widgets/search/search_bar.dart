import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OutlineSearchBar(
      hintText: "Search",
    );
  }
}
