import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            side: BorderSide(width: 1, color: AppColourTheme.neutralDark.w50),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Load more comments",
                  style: AppTextTheme.body2(context)
                      ?.merge(const TextStyle(color: Colors.black, height: 1))),
              const SizedBox(
                width: 7,
              ),
              isLoading
                  ? SizedBox(
                      height: 12,
                      width: 12,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColourTheme.neutralDark.w300,
                        ),
                      ),
                    )
                  : FaIcon(
                      FontAwesomeIcons.chevronDown,
                      size: 16,
                      color: AppColourTheme.neutralDark.w300,
                    ),
            ],
          )),
    );
  }
}
