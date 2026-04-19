
import 'dart:io';

class VideoPreviewArguments {
   
    final File file;
    final bool isNetworkVideo;
    const VideoPreviewArguments({
         required this.file,
         this.isNetworkVideo = false
    });
}