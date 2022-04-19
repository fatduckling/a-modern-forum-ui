import 'package:a_modern_forum_project/widgets/file_upload/web_file_upload.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FileUpload extends StatelessWidget {
  const FileUpload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const WebFileUpload();
    }
    // TODO: implement build
    throw UnimplementedError();
  }
}
