import 'package:flutter/material.dart';
import 'package:fyp_project/Pages/UploadDisaster/LocalUpload/LocalUploadScreen/LocalUplaodCard/localupload_card.dart';

Widget severityProgress(double value) {
  final color = severityLevelColor(value);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Severity Level"),
          Text(
            "${value.toInt()}%",
            style: TextStyle(fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
      const SizedBox(height: 6),

      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 600),
          tween: Tween(begin: 0, end: value / 100),
          builder: (context, val, _) {
            return LinearProgressIndicator(
              value: val,
              minHeight: 8,
              backgroundColor: color.withOpacity(0.15),
              valueColor: AlwaysStoppedAnimation(color),
            );
          },
        ),
      ),
    ],
  );
}
