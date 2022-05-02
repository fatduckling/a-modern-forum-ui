import 'package:a_modern_forum_project/widgets/text/body1.dart';
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

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipOval(
          child: Material(
            color: Colors.transparent, // Button color
            child: InkWell(
              hoverColor: isUpVoted ? null : Colors.green.withOpacity(0.1),
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                setState(() {
                  isDownVoted = false;
                  isUpVoted = !isUpVoted;
                });
              },
              child: Icon(
                Icons.arrow_circle_up_outlined,
                size: 28,
                color: isUpVoted ? Colors.green : Colors.black45,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        TextBody("50",
            color:
                isUpVoted ? Colors.green : (isDownVoted ? Colors.red : null)),
        const SizedBox(
          width: 5,
        ),
        ClipOval(
          child: Material(
            color: Colors.transparent, // Button color
            child: InkWell(
              hoverColor: isDownVoted ? null : Colors.red.withOpacity(0.1),
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                setState(() {
                  isUpVoted = false;
                  isDownVoted = !isDownVoted;
                });
              },
              child: Icon(Icons.arrow_circle_down_outlined,
                  size: 28, color: isDownVoted ? Colors.red : Colors.black45),
            ),
          ),
        ),
      ],
    );
  }
}
