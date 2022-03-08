import 'package:a_modern_forum_project/widgets/collapsed_subforum/responsive_collapsed_subforum.dart';
import 'package:a_modern_forum_project/widgets/scaffold/main_scaffold.dart';
import 'package:a_modern_forum_project/widgets/text/h1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ExploreRoute extends StatelessWidget {
  const ExploreRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      const SizedBox(
        height: 50,
      ),
      Row(
        children: [
          const Spacer(
            flex: 2,
          ),
          const Expanded(flex: 5, child: H1("Forum Explore")),
          Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  iconSize: 40,
                  icon: const Icon(Icons.grid_on),
                  onPressed: () {},
                ),
              )),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
      const SizedBox(
        height: 30,
      ),
      Row(
        children: [
          const Spacer(
            flex: 2,
          ),
          Expanded(
              flex: 6,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        clipBehavior: Clip.antiAlias,
                        margin: EdgeInsets.zero,
                        color: Colors.white,
                        child: Theme(
                            data: ThemeData()
                                .copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              initiallyExpanded: true,
                              title: Text(
                                'General Astronomy $index',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.black),
                              ),
                              children: const <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                ResponsiveCollapsedSubforum(),
                                ResponsiveCollapsedSubforum(),
                                ResponsiveCollapsedSubforum(),
                              ],
                            )),
                      )
                    ]);
                  })),
          const Spacer(
            flex: 2,
          ),
        ],
      )
    ]));
  }
}
