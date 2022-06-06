import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:flutter/material.dart';

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
  static final upVoteColour = AppColourTheme.primary.w300;

  /// Down vote colour
  static final downVoteColour = AppColourTheme.tertiary.w700;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          constraints: const BoxConstraints(),
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.arrow_circle_up_outlined,
            size: 24,
            color: isUpVoted ? upVoteColour : null,
          ),
          tooltip: 'Up vote',
          hoverColor: isUpVoted ? null : upVoteColour.withOpacity(0.1),
          splashRadius: 12,
          onPressed: () {
            setState(() {
              isDownVoted = false;
              isUpVoted = !isUpVoted;
            });
          },
        ),
        const SizedBox(
          width: 10,
        ),
        Text("50",
            style: AppTextTheme.body2(context)?.merge(TextStyle(
                height: 1,
                color: isUpVoted
                    ? upVoteColour
                    : (isDownVoted ? downVoteColour : null)))),
        const SizedBox(
          width: 10,
        ),
        IconButton(
          constraints: const BoxConstraints(),
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.arrow_circle_down_outlined,
            size: 24,
            color: isDownVoted ? downVoteColour : null,
          ),
          tooltip: 'Down vote',
          hoverColor: isDownVoted ? null : downVoteColour.withOpacity(0.1),
          splashRadius: 12,
          onPressed: () {
            setState(() {
              isUpVoted = false;
              isDownVoted = !isDownVoted;
            });
          },
        ),
      ],
    );
  }
}
