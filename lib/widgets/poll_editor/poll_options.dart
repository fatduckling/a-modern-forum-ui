import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/widgets/fa_icon_button/fa_icon_button.dart';
import 'package:a_modern_forum_project/widgets/poll_editor/poll_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PollOptions extends StatefulWidget {
  final PollController pollController;

  const PollOptions({required this.pollController, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PollOptions();
}

class _PollOptions extends State<PollOptions> {
  @override
  Widget build(BuildContext context) {
    final controllers = widget.pollController.controllers;
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controllers.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Table(columnWidths: const {
                0: FixedColumnWidth(30)
              }, children: [
                TableRow(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FAIconButton(
                        tooltip: "Move poll option up",
                        icon: FontAwesomeIcons.circleArrowUp,
                        iconColour: index == 0
                            ? AppColourTheme.neutralDark.w50
                            : AppColourTheme.neutralDark.w500,
                        onTap: index == 0
                            ? null
                            : () {
                                setState(() {
                                  final temp = controllers[index - 1];
                                  controllers[index - 1] = controllers[index];
                                  controllers[index] = temp;
                                });
                              },
                      ),
                      FAIconButton(
                        tooltip: "Move poll option down",
                        icon: FontAwesomeIcons.circleArrowDown,
                        iconColour: index == controllers.length - 1
                            ? AppColourTheme.neutralDark.w50
                            : AppColourTheme.neutralDark.w500,
                        onTap: index == controllers.length - 1
                            ? null
                            : () {
                                setState(() {
                                  final temp = controllers[index + 1];
                                  controllers[index + 1] = controllers[index];
                                  controllers[index] = temp;
                                });
                              },
                      ),
                    ],
                      ),
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                      child: TextField(
                        controller: controllers[index],
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText:
                              'Enter option #${index + 1}${index > 1 ? " or leave blank" : ""}',
                          suffixIcon: index < 2
                              ? null
                              : IconButton(
                                  onPressed: () {
                                    final controller = controllers[index];
                                    setState(() {
                                      controllers.removeAt(index);
                                    });
                                    Future.delayed(Duration.zero,
                                        () => controller.dispose());
                                  },
                                  icon: FaIcon(
                                    FontAwesomeIcons.trashCan,
                                    color: AppColourTheme.neutralDark.w50,
                                  ),
                                ),
                            ),
                          )),
                    ]),
              ]),
              const SizedBox(
                height: 10,
              )
            ],
          );
        });
  }
}
