import 'package:a_modern_forum_project/themes/colour_theme.dart';
import 'package:a_modern_forum_project/themes/text_theme.dart';
import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:a_modern_forum_project/widgets/buttons/normal_button.dart';
import 'package:a_modern_forum_project/widgets/text/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WebFileUpload extends StatefulWidget {
  const WebFileUpload({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WebFileUpload();
}

class _WebFileUpload extends State<WebFileUpload> {
  late final DropzoneViewController controller;

  /// If there is a file hovered over the container
  bool isHovering = false;

  /// True if loading the drop zone has an error
  bool hasError = false;

  /// Error text
  String errorText = "Unknown";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColourTheme.light,
        border: Border.all(color: AppColourTheme.neutralDark.w50),
      ),
      height: 400,
      child: Stack(
        children: [
          DropzoneView(
            operation: DragOperation.copy,
            cursor: CursorType.grab,
            onCreated: (ctrl) => controller = ctrl,
            onLoaded: () => debugPrint('Zone loaded'),
            onError: (String? ev) => setState(() {
              hasError = true;
              errorText = ev ?? "Unknown";
            }),
            onHover: () => setState(() {
              isHovering = true;
            }),
            onDrop: (ev) => setState(() {
              debugPrint(ev);
              isHovering = false;
            }),
            onDropMultiple: (ev) => debugPrint('Drop multiple: ${ev?.length}'),
            onLeave: () => setState(() {
              isHovering = false;
            }),
          ),
          Center(
            child: hasError
                ? ErrorText(
                    "Something went wrong when trying to load the file upload module. If this issue keeps occurring, please contact support. Error: $errorText")
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.image,
                        size: 128,
                        color: isHovering
                            ? AppColourTheme.neutralDark.w500
                            : AppColourTheme.neutralDark.w50,
                      ),
                      Text(
                        "Drag your photos or videos here to start uploading.",
                        style: AppTextTheme.body2(context),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      NormalButton(
                        size: ScreenSize.small,
                        text: "Browse files",
                        onTap: () {},
                      ),
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
