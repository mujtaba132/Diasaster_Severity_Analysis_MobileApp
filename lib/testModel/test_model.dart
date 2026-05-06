import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fyp_project/ai_model/predict_media.dart';
import 'package:image_picker/image_picker.dart';

class TestModelPage extends StatefulWidget {
  const TestModelPage({super.key});

  @override
  State<TestModelPage> createState() => _TestModelPageState();
}

class _TestModelPageState extends State<TestModelPage> {
  final ImagePicker _picker = ImagePicker();
  final ModelPredict _classifier = ModelPredict();

  File? _image;
  String _result = "No result";
  String _confidence = "";

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> loadModel() async {
    await _classifier.loadModel();
  }

  // ================= PICK IMAGE =================
  Future<void> pickImage() async {
    final XFile? picked = await _picker.pickVideo(
      source: ImageSource.gallery,
    );

    if (picked == null) return;

    setState(() {
      _image = File(picked.path);
      _isLoading = true;
      _result = "Processing...";
      _confidence = "";
    });

    await runModel();
  }

  // ================= RUN MODEL =================
  Future<void> runModel() async {
    if (_image == null) return;

   try{
     final output = await _classifier.predictVideo(_image!.path);
    print(output);
    setState(() {
      _result = output["class"];
      _confidence = "${output["confidence"]}%";
      _isLoading = false;
    });}
   catch(e){
       print(e);
       throw Exception(e);
   }

   
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Disaster Classifier Test")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // IMAGE PREVIEW
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.grey.shade200,
              child: _image == null
                  ? const Center(child: Text("No Image Selected"))
                  : Image.file(_image!, fit: BoxFit.cover),
            ),

            const SizedBox(height: 20),

            // BUTTON
            ElevatedButton(
              onPressed: pickImage,
              child: const Text("Pick Image"),
            ),

            const SizedBox(height: 30),

            // RESULT
            _isLoading
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      Text(
                        "Result: $_result",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Confidence: $_confidence",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}