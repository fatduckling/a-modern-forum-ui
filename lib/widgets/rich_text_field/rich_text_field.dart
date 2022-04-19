import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

/// Rich text field powered by Flutter Quill
class RichTextField extends StatelessWidget {
  /// Controller
  final quill.QuillController controller = quill.QuillController.basic();

  /// Placeholder text
  final String placeholder;

  RichTextField({
    Key? key,
    this.placeholder = "Write something great here",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
        ),
        height: 200,
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
            ]));
  }
}
