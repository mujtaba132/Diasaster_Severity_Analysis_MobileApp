import 'dart:io';
import 'dart:math';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';

class DisasterClassifier {

  late Interpreter _interpreter;

  final int inputSize = 224;

  // classes

  final List<String> classNames = [
    'Earthquake',
    'Infrastructure',
    'Urban_Fire',
    'Wild_Fire',
    'Human_Damage',
    'Drought',
    'Land_Slide',
    'Non_Damage_Buildings_Street',
    'Non_Damage_Wildlife_Forest',
    'human',
    'sea',
    'Water_Disaster'
  ];

  //normalization as your PyTorch

  final List<double> mean = [0.485, 0.456, 0.406];
  final List<double> std = [0.229, 0.224, 0.225];


  // loadmodel
  Future<void> loadModel() async {
    _interpreter = await Interpreter.fromAsset('assets/model/disaster_model.tflite');
  }

  // preprocessing
  List<List<List<List<double>>>> preprocess(File imageFile) {
    img.Image image = img.decodeImage(imageFile.readAsBytesSync())!;

    img.Image resized = img.copyResize(image, width: inputSize, height: inputSize);

    List<List<List<List<double>>>> input = List.generate(
      1,
      (_) => List.generate(
        inputSize,
        (y) => List.generate(
          inputSize,
          (x) {
            final pixel = resized.getPixel(x, y);

            double r =  pixel.r / 255.0;
            double g =  pixel.g / 255.0;
            double b =  pixel.b / 255.0;

            r = (r - mean[0]) / std[0];
            g = (g - mean[1]) / std[1];
            b = (b - mean[2]) / std[2];

            return [r, g, b];
          },
        ),
      ),
    );

    return input;
  }

  // softmax

  List<double> softmax(List<double> logits) {
    double maxVal = logits.reduce(max);
    List<double> expVals = logits.map((e) => exp(e - maxVal)).toList();
    double sum = expVals.reduce((a, b) => a + b);
    return expVals.map((e) => e / sum).toList();
  }

  // run Model

  Map<String, dynamic> predict(File imageFile) {
    final input = preprocess(imageFile);

    List<List<double>> output = List.generate(
      1,
      (_) => List.filled(classNames.length, 0),
    );

    _interpreter.run(input, output);


    List<double> probs = softmax(output[0]);

    double maxProb = probs[0];
    int index = 0;

    for (int i = 1; i < probs.length; i++) {
      if (probs[i] > maxProb) {
        maxProb = probs[i];
        index = i;
      }
    }

    return {
      "class": classNames[index],
      "confidence": (maxProb * 100).toStringAsFixed(2),
      "all_probs": probs
    };
  }


}