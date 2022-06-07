import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/widgets/icon_with_text/icon_with_text.dart';
import 'package:a_modern_forum_project/widgets/up_down_votes/up_down_votes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Featured post
class FeaturedPost extends StatelessWidget {

  /// Whether to show the like and comment count button
  final bool showControls;

  /// Maximum lines to display for the description
  final int maxLines;

  /// Title font to use
  final AppTextStyle titleFont;

  /// Description font to use
  final AppTextStyle descriptionFont;

  const FeaturedPost({
    Key? key,
    this.showControls = true,
    this.maxLines = 4,
    this.titleFont = AppTextStyle.h4,
    this.descriptionFont = AppTextStyle.body1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {}, // Handle your callback
        child: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.dstATop),
                image: const AssetImage("assets/images/artwork.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Australia",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: AppTextTheme.getTextStyle(context, titleFont)?.merge(
                      const TextStyle(fontWeight: FontWeight.bold, height: 1)),
                ),
                Text(
                  "Here you can add interesting news about Australia. Artwork created by u/Excellent-Double5168." *
                      3,
                  overflow: TextOverflow.ellipsis,
                  maxLines: maxLines,
                  softWrap: false,
                  style: AppTextTheme.getTextStyle(context, descriptionFont)
                      ?.merge(const TextStyle(fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: showControls ? 10 : 0,
                ),
                showControls
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          UpDownVotes(),
                          IconWithText(
                            icon: FontAwesomeIcons.comment,
                            text: "36",
                            colour: AppColourTheme.dark,
                          )
                        ],
                      )
                    : const SizedBox.shrink()
              ],
            )));
  }
}
