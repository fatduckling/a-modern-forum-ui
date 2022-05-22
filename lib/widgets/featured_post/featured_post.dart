import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/widgets/icon_with_text/icon_with_text.dart';
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
                    Colors.black.withOpacity(0.3), BlendMode.dstATop),
                image: const AssetImage("assets/images/artwork.png"),
                fit: BoxFit.cover,
              ),
            ),
            height: 300,
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Australia",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                    style: AppTextTheme.h4(context)
                        ?.merge(const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    "Here you can add interesting news about Australia. Artwork created by u/Excellent-Double5168.",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    softWrap: false,
                    style: AppTextTheme.body1(context)
                        ?.merge(const TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      UpDownVotes(),
                      IconWithText(
                        icon: Icons.chat_bubble_outline,
                        text: "36",
                        color: AppColourTheme.dark,
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}
