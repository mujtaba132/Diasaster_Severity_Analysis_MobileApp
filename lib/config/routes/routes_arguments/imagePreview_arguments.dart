
import 'dart:io';

class ImagePreviewArguments {
   
    final File file;
    final bool isNetworkImage;

    const ImagePreviewArguments({
         required this.file,
         this.isNetworkImage = false
    });
}