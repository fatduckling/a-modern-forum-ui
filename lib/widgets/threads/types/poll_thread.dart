import 'package:a_modern_forum_project/widgets/buttons/rounded/small/small_rounded_button.dart';
import 'package:a_modern_forum_project/widgets/icon_with_text/icon_with_text.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

/// Displays a polling thread where users can vote and a graph is displayed after
class PollThread extends StatefulWidget {
  const PollThread({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PollThread();
}

class _PollThread extends State<PollThread> {
  /// If is true, the results will show, otherwise the voting option widget will show
  bool _isShowingGraph = false;

  final List<bool> _checkboxValues = [for (int i = 1; i <= 6; i++) i % 2 == 0];

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
            _isShowingGraph ? showResults() : showPollOptions()
          ],
        ));
  }

  /// Widget that displays the poll options
  Widget showPollOptions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _checkboxValues.length,
            itemBuilder: (BuildContext context, int index) {
              return CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text("Option $index"),
                value: _checkboxValues[index],
                onChanged: (newValue) {
                  bool disabled = newValue == null;
                  bool isChecked = !disabled && newValue;
                  setState(() {
                    _checkboxValues[index] = isChecked;
                  });
                },
              );
            }),
        const SizedBox(
          height: 10,
        ),
        SmallRoundedButton(
          "Vote",
          onPressed: () {
            setState(() {
              _isShowingGraph = true;
            });
          },
        ),
      ],
    );
  }

  /// Widget that displays the poll results
  Widget showResults() {
    final List<charts.Series<dynamic, String>> seriesList = [
      charts.Series<VotingData, String>(
          id: "Sales",
          domainFn: (VotingData votingData, _) => votingData.option,
          measureFn: (VotingData votingData, _) => votingData.count,
          labelAccessorFn: (VotingData data, _) => data.count.toString(),
          data: [
            VotingData("Yes I think it works", 121),
            VotingData("No it won't work", 234),
            VotingData("c", 21),
            VotingData("d", 13),
            VotingData("e", 44),
            VotingData("f", 99),
          ])
    ];
    return SizedBox(
      height: 500,
      child: charts.BarChart(
        seriesList,
        animate: true,
        vertical: false,
        barRendererDecorator: charts.BarLabelDecorator<String>(),
        primaryMeasureAxis:
            const charts.NumericAxisSpec(renderSpec: charts.NoneRenderSpec()),
      ),
    );
  }
}

/// Simple data type to hold the poll options and its statistics
class VotingData {
  final String option;
  final int count;

  VotingData(this.option, this.count);
}
