import 'package:a_modern_forum_project/widgets/comment_count/comment_count.dart';
import 'package:a_modern_forum_project/widgets/text/lead.dart';
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
                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Lead(
                        text:
                            "This is the titled of the featured This is the titled of the featured This is the titled of the featured posts and very more"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [UpDownVotes(), CommentCount()],
                  )
                ],
              ),
            )));
  }
}
