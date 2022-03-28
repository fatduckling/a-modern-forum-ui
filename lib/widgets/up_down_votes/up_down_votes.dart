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
        SmallIconButton(),
        SizedBox(
          width: 10,
        ),
        Lead("35"),
        SizedBox(
          width: 10,
        ),
        SmallIconButton(),
      ],
    );
  }
}
