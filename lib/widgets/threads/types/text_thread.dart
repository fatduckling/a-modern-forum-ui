import 'package:flutter/material.dart';

/// Thread body for text threads
class TextThread extends StatelessWidget {
  const TextThread({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          "The quick brown fox jumped over the lazy dog. " * 60,
          overflow: TextOverflow.fade,
          maxLines: 6,
        )),
      ],
    );
  }
}
