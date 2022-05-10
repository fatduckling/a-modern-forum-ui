import 'package:a_modern_forum_project/utils/text_theme.dart';
import 'package:a_modern_forum_project/widgets/buttons/bordered_button.dart';
import 'package:a_modern_forum_project/widgets/poll_editor/poll_controller.dart';
import 'package:a_modern_forum_project/widgets/poll_editor/poll_options.dart';
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
                          children: [
                            Text(
                              "Best practices:",
                              style: AppTextTheme.body2bold(context),
                            ),
                            Text("1. Keep questions neutral",
                                style: AppTextTheme.body2(context)),
                            Text("2. Keep a balanced set of answers",
                                style: AppTextTheme.body2(context)),
                            Text("3. Don't ask multiple things at once",
                                style: AppTextTheme.body2(context)),
                            Text("4. Avoid misleading questions",
                                style: AppTextTheme.body2(context))
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
                        BorderedButton(
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
                            Text(
                              "Voting length:",
                              style: AppTextTheme.body3(context),
                            ),
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
                                      child: Text(
                                        "$day day${day == 1 ? '' : "s"}",
                                        style: AppTextTheme.body2(context),
                                      ),
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
