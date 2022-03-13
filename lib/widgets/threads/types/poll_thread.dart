import 'package:a_modern_forum_project/widgets/buttons/rounded/small/small_rounded_button.dart';
import 'package:a_modern_forum_project/widgets/icon_with_text/icon_with_text.dart';
import 'package:flutter/material.dart';

/// Displays an
class PollThread extends StatefulWidget {
  const PollThread({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PollThread();
}

class _PollThread extends State<PollThread> {
  final List<bool> checkboxValues = [for (var i = 1; i <= 6; i++) i % 2 == 0];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: Colors.black12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                IconWithText(icon: Icons.poll_outlined, text: "750 votes"),
                Text("234 days remaining")
              ],
            ),
            const Divider(),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: checkboxValues.length,
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text("Option $index"),
                    //    <-- label
                    value: checkboxValues[index],
                    onChanged: (newValue) {
                      bool disabled = newValue == null;
                      bool isChecked = !disabled && newValue;
                      setState(() {
                        checkboxValues[index] = isChecked;
                      });
                    },
                  );
                }),
            const SizedBox(
              height: 10,
            ),
            const SmallRoundedButton("Vote"),
          ],
        ));
  }
}
