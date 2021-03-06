import 'package:a_modern_forum_project/models/thread/types/text_model.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
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
          child: Text(model.text,
              overflow: isCompact ? TextOverflow.fade : null,
              maxLines: isCompact ? 6 : null,
              style: AppTextTheme.body3(context)),
        ),
      ],
    );
  }
}
