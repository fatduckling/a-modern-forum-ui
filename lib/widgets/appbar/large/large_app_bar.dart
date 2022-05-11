import 'package:a_modern_forum_project/routes/explore.dart';
import 'package:a_modern_forum_project/routes/home.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/widgets/buttons/normal_button.dart';
import 'package:a_modern_forum_project/widgets/search_bar/search_bar.dart';
import 'package:flutter/material.dart';

class LargeAppBar extends StatelessWidget {
  const LargeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const activeTextStyle = TextStyle(fontWeight: FontWeight.bold);
    return AppBar(
      automaticallyImplyLeading: true,
      leadingWidth: 300,
      leading: Container(
        padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
                child: Text(
              'Forum Name',
              style: AppTextTheme.h4(context),
            ))
          ],
        ),
      ),
      title: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: SizedBox(
              height: kToolbarHeight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeRoute()),
                  );
                },
                child: Text(
                  "Home",
                  style: AppTextTheme.body1(context)?.merge(activeTextStyle),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
                height: kToolbarHeight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ExploreRoute()),
                    );
                  },
                  child: Text(
                    "Explore",
                    style: AppTextTheme.body1(context),
                  ),
                )),
          ),
          const SizedBox(
            width: 5,
          ),
          const Expanded(
            flex: 5,
            child: SearchBar(),
          ),
          const SizedBox(
            width: 5,
          ),
          const Spacer(
            flex: 1,
          ),
          const Expanded(
              flex: 1,
              child: NormalButton(
                text: "Login",
              )),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
