import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/buttons/normal_button.dart';
import 'package:flutter/material.dart';

/// Used to display the flair of a post
class Flair extends StatelessWidget {
  const Flair({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NormalButton(
      size: ScreenSize.extraSmall,
      text: "no politics",
      borderRadius: 0,
      backgroundColour: AppColourTheme.neutralLight.w900,
      onTap: () {},
    );
  }
}
