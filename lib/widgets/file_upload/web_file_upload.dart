import 'package:a_modern_forum_project/widgets/buttons/rounded/small/small_rounded_button.dart';
import 'package:a_modern_forum_project/widgets/text/body2.dart';
import 'package:a_modern_forum_project/widgets/text/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

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
        color: Colors.white,
        border: Border.all(color: Colors.black26),
      ),
      height: 400,
      child: Stack(
        children: [
          DropzoneView(
            operation: DragOperation.copy,
            cursor: CursorType.grab,
            onCreated: (ctrl) => controller = ctrl,
            onLoaded: () => print('Zone loaded'),
            onError: (String? ev) => setState(() {
              hasError = true;
              errorText = ev ?? "Unknown";
            }),
            onHover: () => setState(() {
              isHovering = true;
            }),
            onDrop: (ev) => setState(() {
              print(ev);
              isHovering = false;
            }),
            onDropMultiple: (ev) => print('Drop multiple: ${ev?.length}'),
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
                      Icon(
                        Icons.image_outlined,
                        size: 128,
                        color: isHovering ? Colors.black45 : Colors.black26,
                      ),
                      const TextBody2(
                        "Drag your photos or videos here to start uploading.",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SmallRoundedButton(
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
