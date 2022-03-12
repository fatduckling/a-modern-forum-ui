import 'package:flutter/material.dart';

/// Shows an user-uploaded image in a thread
class ImageThread extends StatefulWidget {
  final String _url;

  /// Maximum height of an image
  static const double maximumImageHeight = 400;

  const ImageThread({required String url, Key? key})
      : _url = url,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _ImageThread();
}

class _ImageThread extends State<ImageThread> {
  /// The loadingProgress argument contains the current progress towards loading the image.
  /// This argument will be non-null while the image is loading, but it will be null in the following cases:
  /// When the widget is first rendered before any bytes have been loaded.
  /// When an image has been fully loaded and is available to be painted.
  bool _startedLoadingImage = false;

  /// How much % the image has loaded
  /// A value of -1 represents unknown value
  double _loadingPercent = -1;

  /// Image width
  /// A value of -1 represents unknown value
  double _imageWidth = -1;

  /// Image height
  /// A value of -1 represents unknown value
  double _imageHeight = -1;

  @override
  Widget build(BuildContext context) {
    Image image = Image.network(
      widget._url,
      fit: BoxFit.cover,
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        return const Text(
          "An error has occurred while trying to load this image",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        );
      },
      loadingBuilder:
          (BuildContext ctx, Widget child, ImageChunkEvent? loadingProgress) {
        _startedLoadingImage |= loadingProgress != null;
        bool isFinishedLoading =
            (loadingProgress == null && _startedLoadingImage) ||
                (_imageWidth > 0 && _imageHeight > 0);
        if (isFinishedLoading) {
          return SizedBox(
            height: _imageHeight > ImageThread.maximumImageHeight
                ? ImageThread.maximumImageHeight
                : _imageHeight,
            child: AspectRatio(
              aspectRatio: _imageWidth / _imageHeight,
              child: child,
            ),
          );
        } else {
          if (loadingProgress != null) {
            int total = loadingProgress.expectedTotalBytes == null
                ? 0
                : loadingProgress.expectedTotalBytes as int;
            _loadingPercent = total > 0
                ? (loadingProgress.cumulativeBytesLoaded.toDouble() /
                    total.toDouble())
                : -1;
          }
          return Center(
            child: CircularProgressIndicator(
              semanticsLabel: "Circular Progress Indicator",
              value: _loadingPercent > 0 ? _loadingPercent : null,
            ),
          );
        }
      },
    );
    image.image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      _imageWidth = info.image.width.toDouble();
      _imageHeight = info.image.height.toDouble();
    }));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [Flexible(child: image)],
    );
  }
}
