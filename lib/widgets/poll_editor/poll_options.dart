import 'package:a_modern_forum_project/widgets/poll_editor/poll_controller.dart';
import 'package:flutter/material.dart';

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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: index == 0
                              ? null
                              : () {
                                  setState(() {
                                    final temp = controllers[index - 1];
                                    controllers[index - 1] = controllers[index];
                                    controllers[index] = temp;
                                  });
                                },
                          child: Icon(
                            Icons.arrow_circle_up_outlined,
                            color: index == 0 ? Colors.black12 : Colors.black26,
                          )),
                      InkWell(
                        onTap: index == controllers.length - 1
                            ? null
                            : () {
                                setState(() {
                                  final temp = controllers[index + 1];
                                  controllers[index + 1] = controllers[index];
                                  controllers[index] = temp;
                                });
                              },
                        child: Icon(
                          Icons.arrow_circle_down_outlined,
                          color: index == controllers.length - 1
                              ? Colors.black12
                              : Colors.black26,
                        ),
                      )
                    ],
                  ),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
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
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.black26,
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
