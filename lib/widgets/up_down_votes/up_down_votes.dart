import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/widgets/fa_icon_button/fa_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UpDownVotes extends StatefulWidget {
  const UpDownVotes({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UpDownVotes();
}

class _UpDownVotes extends State<UpDownVotes> {
  /// If true, the user has up voted the post
  bool isUpVoted = false;

  /// If true, the user has down voted the post
  bool isDownVoted = false;

  /// Up vote colour
  static final upVoteColour = AppColourTheme.primary.w500;

  /// Down vote colour
  static final downVoteColour = AppColourTheme.tertiary.w700;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FAIconButton(
            icon: FontAwesomeIcons.circleUp,
            tooltip: "Up vote",
            iconColour: isUpVoted ? upVoteColour : null,
            onTap: () {
              setState(() {
                isDownVoted = false;
                isUpVoted = !isUpVoted;
              });
            }),
        const SizedBox(
          width: 10,
        ),
        Text("50",
            style: AppTextTheme.body2bold(context)?.merge(TextStyle(
                height: 1,
                color: isUpVoted
                    ? upVoteColour
                    : (isDownVoted ? downVoteColour : null)))),
        const SizedBox(
          width: 10,
        ),
        FAIconButton(
            icon: FontAwesomeIcons.circleDown,
            iconColour: isDownVoted ? downVoteColour : null,
            tooltip: "Down vote",
            onTap: () {
              setState(() {
                isUpVoted = false;
                isDownVoted = !isDownVoted;
              });
            }),
      ],
    );
  }
}
