import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;

class ModelPreProcess{

     
  static List<List<List<List<double>>>> preprocessImage(img.Image image) {
  img.Image resized = img.copyResize(image, width: 224, height: 224);

   return List.generate(
    1,
    (_) => List.generate(
      3,
      (c) => List.generate(
        224,
        (y) => List.generate(
          224,
          (x) {
            final pixel = resized.getPixel(x, y);

            double r = pixel.r / 255.0;
            double g = pixel.g / 255.0;
            double b = pixel.b / 255.0;

            // normalization (same as training)
            r = (r - 0.485) / 0.229;
            g = (g - 0.456) / 0.224;
            b = (b - 0.406) / 0.225;

            if (c == 0) return r;
            if (c == 1) return g;
            return b;
          },
        ),
      ),
    ),
   );
  }


  static List<List<List<List<double>>>> preprocessFromFile(File file) {
  img.Image image = img.decodeImage(file.readAsBytesSync())!;
  return preprocessImage(image);
   }
    

  static List<List<List<List<double>>>> preprocessFromBytes(Uint8List bytes) {
  img.Image image = img.decodeImage(bytes)!;
  return preprocessImage(image);
  }

}