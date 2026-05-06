import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:fyp_project/ai_model/extract_video_frames.dart';
import 'package:fyp_project/ai_model/pre_process.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class ModelPredict {
  
  late Interpreter _interpreter;

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


  Future<void> loadModel() async {
    _interpreter = await Interpreter.fromAsset(
      'assets/model/disaster_model.tflite',
    );
  }


  List<double> softmax(List<double> logits) {
    double maxVal = logits.reduce(max);
    List<double> expVals = logits.map((e) => exp(e - maxVal)).toList();
    double sum = expVals.reduce((a, b) => a + b);
    return expVals.map((e) => e / sum).toList();
  }


  Map<String, dynamic> _predict(
    List<List<List<List<double>>>> input,
  ) {
    List<List<double>> output = [
      List.filled(classNames.length, 0)
    ];

    _interpreter.run(input, output);

    List<double> probs = softmax(output[0]);


    print(probs);

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


  Map<String, dynamic> predictImage(File file) {
    final input = ModelPreProcess.preprocessFromFile(file);
    return _predict(input);
  }


  Map<String, dynamic> predictFrame(Uint8List bytes) {
    final input = ModelPreProcess.preprocessFromBytes(bytes);
    return _predict(input);
  }



  Future<Map<String, dynamic>> predictVideo(
    String filePath
  ) async {

    final frames = await VideoFrames.extractFrames(filePath);

    if (frames.isEmpty) {
      return {
        "class": "No Frames",
        "confidence": "0"
      };
    }

    List<String> predictions = [];

    for (var frame in frames) {
      final result = predictFrame(frame);
      predictions.add(result["class"]);
    }

    // Majority voting
    Map<String, int> countMap = {};

    for (var p in predictions) {
      countMap[p] = (countMap[p] ?? 0) + 1;
    }

    String finalClass = countMap.entries
        .reduce((a, b) => a.value > b.value ? a : b)
        .key;

    double confidence =
        (countMap[finalClass]! / predictions.length) * 100;

    return {
      "class": finalClass,
      "confidence": confidence.toStringAsFixed(2),
      "frames": predictions.length,
      "all_predictions": predictions
    };
  }

}