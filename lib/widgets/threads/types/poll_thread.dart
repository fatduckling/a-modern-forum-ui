import 'package:a_modern_forum_project/models/thread/types/poll_model.dart';
import 'package:a_modern_forum_project/widgets/buttons/rounded/small/small_rounded_button.dart';
import 'package:a_modern_forum_project/widgets/icon_with_text/icon_with_text.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

/// Displays a polling thread where users can vote and a graph is displayed after
class PollThread extends StatefulWidget {
  /// Model holds information about the thread
  final PollModel model;

  const PollThread({required this.model, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PollThread();
}

class _PollThread extends State<PollThread> {
  /// If is true, the results will show, otherwise the voting option widget will show
  bool _isShowingGraph = false;

  /// Maps the option index to a boolean representing whether the value is checked or not
  final List<bool> _checkboxValues = [];

  /// Options to choose from
  final List<String> _options = [];

  @override
  void initState() {
    super.initState();
    final pollingData = widget.model.pollingData;
    pollingData.forEach((optionName, count) {
      _checkboxValues.add(false);
      _options.add(optionName);
    });
  }

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
                title: Text(_options[index]),
                value: _checkboxValues[index],
                onChanged: (newValue) {
                  bool disabled = newValue == null;
                  bool isChecked = !disabled && newValue;
                  setState(() {
                    if (!widget.model.allowMultipleAnswers) {
                      for (int i = 0;
                          i < widget.model.pollingData.length;
                          i++) {
                        _checkboxValues[i] = false;
                      }
                    }
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
          data: _options.map((String optionName) {
            int count = widget.model.pollingData[optionName] ?? 0;
            return VotingData(optionName, count);
          }).toList(growable: false))
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
