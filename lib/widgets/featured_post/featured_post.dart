import 'package:a_modern_forum_project/widgets/icon_with_text/icon_with_text.dart';
import 'package:a_modern_forum_project/widgets/text/body1.dart';
import 'package:a_modern_forum_project/widgets/up_down_votes/up_down_votes.dart';
import 'package:flutter/material.dart';

class FeaturedPost extends StatelessWidget {
  const FeaturedPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {}, // Handle your callback
        child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.dstATop),
                image: const AssetImage("assets/images/placeholder.png"),
                fit: BoxFit.cover,
              ),
            ),
            height: 300,
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: TextBody(
                        "Post content" * 25,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        softWrap: false,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      UpDownVotes(),
                      IconWithText(icon: Icons.mode_comment, text: "36")
                    ],
                  )
                ],
              ),
            )));
  }
}
