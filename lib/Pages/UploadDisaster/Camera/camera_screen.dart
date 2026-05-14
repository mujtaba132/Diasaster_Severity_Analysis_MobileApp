import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/UploadDisaster/Camera/Image_card/image_card_pickers.dart';
import 'package:fyp_project/Pages/UploadDisaster/Camera/PredictSeverity/predict_severity.dart';
import 'package:fyp_project/Pages/UploadDisaster/Camera/SeverityCard/severity_card.dart';
import 'package:fyp_project/blocs/camera/camera_bloc.dart';
import 'package:fyp_project/main.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraBloc _cameraBloc;

  @override
  void initState() {
    super.initState();
    _cameraBloc = getit<CameraBloc>();
  }

  @override
  void dispose() {
    _cameraBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider.value(
      value: _cameraBloc,
      child: Scaffold(
        backgroundColor: isDark
            ? const Color(0xff0F172A)
            : const Color(0xffF8FAFC),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,

          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,

          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,

                colors: isDark
                    ? [const Color(0xff0F172A), const Color(0xff111827)]
                    : [Colors.white, const Color(0xffF8FAFC)],
              ),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(isDark ? 0.4 : 0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
          ),

          leading: Container(
            margin: const EdgeInsets.all(8),

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDark
                  ? Colors.white.withOpacity(0.08)
                  : Colors.black.withOpacity(0.05),
            ),

            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 18,
                color: isDark ? Colors.white : Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),

          title: Column(
            children: [
              Text(
                "Disaster Analysis",

                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.3,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),

              const SizedBox(height: 2),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

                  color: isDark
                      ? Colors.white.withOpacity(0.08)
                      : Colors.black.withOpacity(0.05),
                ),

                child: Text(
                  "AI Severity Detection",

                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white70 : Colors.black54,
                  ),
                ),
              ),
            ],
          ),

          actions: [
            Container(
              margin: const EdgeInsets.only(right: 12),

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark
                    ? Colors.white.withOpacity(0.08)
                    : Colors.black.withOpacity(0.05),
              ),

              child: IconButton(
                icon: Icon(
                  Icons.info_outline_rounded,
                  color: isDark ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("How it works"),
                      content: const Text(
                        "Upload pre & post disaster images to predict severity using AI model.",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              const ImageCardPickers(),

              const SizedBox(height: 30),

              const PredictSeverityButton(),

              const SizedBox(height: 30),

              const SeverityCard(),
            ],
          ),
        ),
      ),
    );
  }
}
