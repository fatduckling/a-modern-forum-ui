import 'package:a_modern_forum_project/widgets/icon_button/small/small_icon_button.dart';
import 'package:a_modern_forum_project/widgets/text/lead.dart';
import 'package:flutter/material.dart';

class UpDownVotes extends StatefulWidget {
  const UpDownVotes({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UpDownVotes();
}

class _UpDownVotes extends State<UpDownVotes> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        SizedBox(
          width: 10,
        ),
        SmallIconButton(),
        Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Lead(text: "34")),
        SmallIconButton(),
      ],
    );
  }
}
