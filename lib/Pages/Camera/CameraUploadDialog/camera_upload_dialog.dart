import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/Camera/CameraUploadDialog/buttons/cancelBtn.dart';
import 'package:fyp_project/Pages/Camera/CameraUploadDialog/buttons/uploadBtn.dart';
import 'package:fyp_project/Pages/Camera/CameraUploadDialog/container_icon.dart';
import 'package:fyp_project/Pages/Camera/CameraUploadDialog/perview_box.dart';
import 'package:fyp_project/Pages/Camera/CameraUploadDialog/title_description.dart';
import 'package:fyp_project/blocs/camera/camera_bloc.dart';
import 'package:fyp_project/main.dart';

void showUploadDialog({required BuildContext context, required File file}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => UploadDialog(uploadFile: file),
  );
}

class UploadDialog extends StatefulWidget {
  final File uploadFile;
  const UploadDialog({super.key, required this.uploadFile});

  @override
  State<UploadDialog> createState() => _UploadDialogState();
}

class _UploadDialogState extends State<UploadDialog>
    with SingleTickerProviderStateMixin {
  late CameraBloc _cameraBloc;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _cameraBloc = getit<CameraBloc>();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _controller.forward();
  }

  Future<void> _closeDialog() async {
    await _controller.reverse();
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _cameraBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider.value(
      value: _cameraBloc,
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ContainerIcon(),

                const SizedBox(height: 16),

                TitleDescription(),

                const SizedBox(height: 20),

                PerviewBox(file: widget.uploadFile),

                const SizedBox(height: 20),

                Row(
                  children: [
                    Cancelbtn(onPressed: _closeDialog),

                    const SizedBox(width: 12),

                    UploadBtn(filePath: widget.uploadFile.path,onPressed:  _closeDialog),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
