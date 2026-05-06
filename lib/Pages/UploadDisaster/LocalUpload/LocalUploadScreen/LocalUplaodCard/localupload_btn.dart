import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/Pages/UploadDisaster/LocalUpload/CameraUploadDialog/camera_upload_dialog.dart';

class UploadButton extends StatelessWidget {
  final MediaModel model;
  const UploadButton({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () { 
           showUploadDialog(context: context,model: model);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),

          // BLUR EFFECT
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),

            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: theme.colorScheme.surface.withOpacity(0.25),
                border: Border.all(
                  color: theme.colorScheme.primary.withOpacity(0.3),
                  width: 1,
                ),
              ),

              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.cloud_upload_rounded,
                    color: theme.colorScheme.primary,
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "Upload",
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

