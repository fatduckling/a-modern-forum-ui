import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:flutter/material.dart';

class LoadMoreCommentsButton extends StatefulWidget {
  const LoadMoreCommentsButton({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoadMoreComments();
}

class _LoadMoreComments extends State<LoadMoreCommentsButton> {
  /// If true, a loading spinner will be shown
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: OutlinedButton(
          onPressed: () {
            setState(() {
              isLoading = !isLoading;
            });
          },
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            side: const BorderSide(width: 1, color: Colors.black26),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Load more comments",
                  style: AppTextTheme.body2(context)
                      ?.merge(const TextStyle(color: Colors.black, height: 1))),
              isLoading
                  ? Row(
                      children: const [
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 12,
                          width: 12,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.black45,
                            ),
                          ),
                        )
                      ],
                    )
                  : const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.black45,
                    ),
            ],
          )),
    );
  }
}
