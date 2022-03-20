import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class CommentBox extends StatelessWidget {
  final quill.QuillController controller = quill.QuillController.basic();

  CommentBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          flex: 1,
          child: Icon(
            Icons.circle,
            size: 64,
          ),
        ),
        Expanded(
            flex: 9,
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
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
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: quill.QuillEditor(
                          autoFocus: true,
                          expands: true,
                          scrollController: ScrollController(),
                          scrollable: true,
                          placeholder: "Hello world",
                          focusNode: FocusNode(),
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          controller: controller,
                          readOnly: false, // true for view only mode
                        ),
                      ),
                    ]))),
      ],
    );
  }
}
