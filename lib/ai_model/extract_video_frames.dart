
import 'dart:typed_data';

import 'package:video_thumbnail/video_thumbnail.dart';

class VideoFrames {

 static Future<List<Uint8List>> extractFrames(String videoPath) async {
  List<Uint8List> frames = [];

  // take frame every 1 second
  for (int i = 0; i < 10; i++) {
    final uint8list = await VideoThumbnail.thumbnailData(
      video: videoPath,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 224,
      quality: 75,
      timeMs: i * 1000,
    );

    if (uint8list != null) {
      frames.add(uint8list);
    }
  }

  return frames;
}

}