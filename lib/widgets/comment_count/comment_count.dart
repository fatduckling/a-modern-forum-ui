import 'package:a_modern_forum_project/widgets/text/lead.dart';
import 'package:flutter/material.dart';

class CommentCount extends StatelessWidget {
  const CommentCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(
          Icons.mode_comment,
          color: Colors.blue,
          size: 28,
        ),
        Padding(
          padding: EdgeInsets.only(left: 5, bottom: 5),
          child: Lead(text: "33"),
        )
      ],
    );
  }
}
