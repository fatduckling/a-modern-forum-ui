import 'package:a_modern_forum_project/models/thread/types/text_model.dart';
import 'package:a_modern_forum_project/widgets/text/body3.dart';
import 'package:flutter/material.dart';

/// Thread body for text threads
class TextThread extends StatelessWidget {
  /// Model holds information about the thread
  final TextModel model;

  const TextThread({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isCompact = model.isCompact;
    return Row(
      children: [
        Expanded(
            child: TextBody3(
          model.text,
          overflow: isCompact ? TextOverflow.fade : null,
          maxLines: isCompact ? 6 : null,
        )),
      ],
    );
  }
}
