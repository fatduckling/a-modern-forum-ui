import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/buttons/normal_button.dart';
import 'package:a_modern_forum_project/widgets/rich_text_field/rich_text_field.dart';
import 'package:flutter/material.dart';

/// Comment editor
class CommentEditor extends StatelessWidget {
  /// Icon size
  final double iconSize;

  /// Default placeholder text
  final String placeholder;

  const CommentEditor(
      {this.iconSize = 64,
      this.placeholder = "Write something great here",
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.circle,
          size: iconSize,
        ),
        const SizedBox(width: 10),
        Flexible(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          RichTextField(
            placeholder: placeholder,
          ),
          const SizedBox(
            height: 10,
          ),
          const NormalButton(
            size: ScreenSize.small,
            text: "Post comment",
          ),
        ]))
      ],
    );
  }
}
