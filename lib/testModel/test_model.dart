import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fyp_project/repository/model_predict_repository/model_predict_repository.dart';
import 'package:image_picker/image_picker.dart';

class TestModelPage extends StatefulWidget {
  const TestModelPage({super.key});

  @override
  State<TestModelPage> createState() => _TestModelPageState();
}

class _TestModelPageState extends State<TestModelPage> {
  final ImagePicker _picker = ImagePicker();

  File? _preImage;
  File? _postImage;

  String _result = "No result";
  String _confidence = "";
  bool _isLoading = false;

  // ================= PICK IMAGES =================

  Future<void> pickPreImage() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() => _preImage = File(picked.path));
    }
  }

  Future<void> pickPostImage() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() => _postImage = File(picked.path));
    }
  }

  // ================= RUN MODEL (KOTLIN BRIDGE) =================

  // Inside _TestModelPageState class
  final ModelPredictRepository _repository = ModelPredictRepository();

  Future<void> runModel() async {
    if (_preImage == null || _postImage == null) return;

    setState(() {
      _isLoading = true;
      _result = "Uploading to Server...";
    });

    try {
      // Calling the API Repository
      final output = await _repository.predictImage(_preImage!, _postImage!);

      setState(() {
        // Mapping the keys from your screenshot (damage_intensity, confidence, severity)
        _result = output["damage_intensity"] ?? "Unknown";
        _confidence =
            "${output["confidence"]}% (Severity: ${output["severity"]}%)";
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _result = "Error";
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Upload Failed: $e")));
    }
  }
  // ================= UI =================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bi-Temporal Damage Assessment")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: _buildImagePreview(_preImage, "Pre-Disaster")),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildImagePreview(_postImage, "Post-Disaster"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: pickPreImage,
                    child: const Text("Pick Pre-Image"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: pickPostImage,
                    child: const Text("Pick Post-Image"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: (_preImage != null && _postImage != null)
                  ? runModel
                  : null,
              child: const Text("Analyze Damage Severity"),
            ),

            const SizedBox(height: 30),

            _isLoading
                ? const CircularProgressIndicator()
                : _buildResultSection(),
          ],
        ),
      ),
    );
  }

  // ================= IMAGE PREVIEW =================

  Widget _buildImagePreview(File? file, String label) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: file == null
              ? const Icon(Icons.image, size: 50, color: Colors.grey)
              : ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(file, fit: BoxFit.cover),
                ),
        ),
      ],
    );
  }

  // ================= RESULT =================

  Widget _buildResultSection() {
    return Column(
      children: [
        Text(
          "Result: $_result",
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          "Confidence: $_confidence",
          style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
        ),
      ],
    );
  }
}
