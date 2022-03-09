import 'package:a_modern_forum_project/widgets/recent_post/recent_post.dart';
import 'package:flutter/material.dart';

class LargeExpandedSubforum extends StatelessWidget {
  const LargeExpandedSubforum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Ink(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: IntrinsicHeight(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            const Icon(
                              Icons.circle,
                              size: 48,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                                child: Text(
                              "Beginners Forum",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                              maxLines: 2,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                            )),
                          ]),
                          Text("Text " * 100),
                          SizedBox(
                            height: 20,
                          ),
                          RecentPost()
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        // color: Colors.green,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            VerticalDivider(color: Colors.black12),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.mode_comment_outlined,
                                  size: 36,
                                  color: Colors.blue,
                                ),
                                Text("123456"),
                                SizedBox(
                                  height: 30,
                                ),
                                Icon(
                                  Icons.chat,
                                  size: 36,
                                  color: Colors.blue,
                                ),
                                Text("123456"),
                              ],
                            )
                          ],
                        ),
                      )),
                ],
              )),
            ),
          ),
        ));
  }
}
