import 'package:a_modern_forum_project/widgets/icon_with_text/icon_with_text.dart';
import 'package:flutter/material.dart';

class LargeCollapsedSubforum extends StatelessWidget {
  const LargeCollapsedSubforum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                IntrinsicHeight(
                    child: Row(
                  children: [
                    Expanded(
                        flex: 4,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.circle,
                                size: 48,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                  child: Text(
                                "Beginners Forum" * 50,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                                maxLines: 2,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              )),
                            ])),
                    Expanded(
                        flex: 6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Flexible(
                                child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: const [
                                          IconWithText(
                                              icon: Icons.mode_comment_outlined,
                                              text: "12345"),
                                        ])),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        // color: Colors.grey,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: const [
                                          IconWithText(
                                              icon: Icons.chat, text: "67890"),
                                        ]))),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                        //color: Colors.yellow,
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        VerticalDivider(color: Colors.black12)
                                      ],
                                    ))),
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                        // color: Colors.red,
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.circle,
                                          size: 32,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Flexible(
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: const [
                                              Text(
                                                "Recent post title",
                                                softWrap: false,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Today at 1pm by User 123",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                softWrap: false,
                                              )
                                            ])),
                                      ],
                                    )))
                              ],
                            ))
                          ],
                        ))
                  ],
                ))
              ],
            )),
      ),
    );
  }
}
