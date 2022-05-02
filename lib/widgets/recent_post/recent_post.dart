import 'package:a_modern_forum_project/widgets/text/body2.dart';
import 'package:a_modern_forum_project/widgets/text/h4.dart';
import 'package:flutter/material.dart';

class RecentPost extends StatelessWidget {
  const RecentPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
          Icons.circle,
          size: 32,
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
              H4(
                "Recent post title",
                softWrap: false,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 10,
              ),
              TextBody2(
                "Today at 1pm by User 123",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
              )
            ])),
      ],
    );
  }
}
