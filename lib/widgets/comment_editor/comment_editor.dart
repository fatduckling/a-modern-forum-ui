import 'package:a_modern_forum_project/widgets/buttons/rounded/small/small_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

/// Comment editor
class CommentEditor extends StatelessWidget {
  final quill.QuillController controller = quill.QuillController.basic();

  /// Icon size
  final double iconSize;

  /// Default placeholder text
  final String placeholder;

  CommentEditor(
      {this.iconSize = 64,
      this.placeholder = "Write something great here",
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.circle,
          size: iconSize,
        ),
        const SizedBox(width: 10),
        Flexible(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black12),
              ),
              height: 200,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                                child: quill.QuillToolbar.basic(
                              controller: controller,
                              showImageButton: false,
                              showVideoButton: false,
                              showCameraButton: false,
                              toolbarSectionSpacing: 0,
                              multiRowsDisplay: false,
                            ))
                          ],
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.black12,
                            child: quill.QuillEditor(
                              autoFocus: false,
                              expands: true,
                              scrollController: ScrollController(),
                              scrollable: true,
                              placeholder: placeholder,
                              focusNode: FocusNode(),
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              controller: controller,
                              readOnly: false, // true for view only mode
                            ),
                          ),
                        ),
                      ]))),
          const SizedBox(
            height: 10,
          ),
          const SmallRoundedButton(
            text: "Post comment",
          ),
        ]))
      ],
    );
  }
}
