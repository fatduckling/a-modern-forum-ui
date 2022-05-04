import 'package:a_modern_forum_project/widgets/buttons/rounded_outline/small/small_outline_button.dart';
import 'package:a_modern_forum_project/widgets/poll_editor/poll_controller.dart';
import 'package:a_modern_forum_project/widgets/poll_editor/poll_options.dart';
import 'package:a_modern_forum_project/widgets/text/body2.dart';
import 'package:a_modern_forum_project/widgets/text/body2_bold.dart';
import 'package:a_modern_forum_project/widgets/text/body3.dart';
import 'package:flutter/material.dart';

/// Widget used to allow users to create polls
class PollEditor extends StatefulWidget {
  const PollEditor({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PollEditor();
}

class _PollEditor extends State<PollEditor> {
  final PollController pollController = PollController();

  @override
  void dispose() {
    pollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black26),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 7,
                  child: Column(
                    children: [
                      PollOptions(pollController: pollController),
                    ],
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            TextBody2Bold("Best practices:"),
                            TextBody2("1. Keep questions neutral"),
                            TextBody2("2. Keep a balanced set of answers"),
                            TextBody2("3. Don't ask multiple things at once"),
                            TextBody2("4. Avoid misleading questions"),
                          ],
                        ))
                      ],
                    ))
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                    flex: 7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallOutlineButton(
                          onTap: pollController.size() < 10
                              ? () {
                                  setState(() {
                                    pollController.addPollOption();
                                  });
                                }
                              : null,
                          text: "Add Option",
                          icon: Icons.add_circle_outline_outlined,
                          colour: Colors.black.withOpacity(0.9),
                        ),
                        Row(
                          children: [
                            const TextBody3("Voting length:"),
                            const SizedBox(
                              width: 5,
                            ),
                            DropdownButton<String>(
                                value: "3",
                                focusColor: Colors.transparent,
                                underline: const SizedBox.shrink(),
                                onChanged: (String? newValue) {},
                                items: [
                                  for (var day in [1, 2, 3, 5, 7, 9])
                                    DropdownMenuItem<String>(
                                      value: day.toString(),
                                      child: TextBody2(
                                          "$day day${day == 1 ? '' : "s"}"),
                                    )
                                ])
                          ],
                        )
                      ],
                    )),
                const Spacer(
                  flex: 3,
                )
              ],
            )
          ],
        ));
  }
}