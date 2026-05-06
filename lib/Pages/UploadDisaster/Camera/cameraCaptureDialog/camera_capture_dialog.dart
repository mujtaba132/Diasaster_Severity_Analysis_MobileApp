import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/UploadDisaster/Camera/cameraCaptureDialog/buttons/submit_btn.dart';
import 'package:fyp_project/Pages/UploadDisaster/LocalUpload/CameraUploadDialog/buttons/cancelBtn.dart';
import 'package:fyp_project/Pages/UploadDisaster/LocalUpload/CameraUploadDialog/container_icon.dart';
import 'package:fyp_project/Pages/UploadDisaster/LocalUpload/CameraUploadDialog/title_description.dart';
import 'package:fyp_project/blocs/camera/camera_bloc.dart';
import 'package:fyp_project/config/Components/Custom_UploadTile.dart';
import 'package:fyp_project/main.dart';

void showCameraCaptureDialog({
  required BuildContext context, 
  required File file}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => 
    CameraCaptureDialog(file: file)
  );
}


class CameraCaptureDialog extends StatefulWidget {

  final File file;
  const CameraCaptureDialog({super.key,required this.file});

  @override
  State<CameraCaptureDialog> createState() => _CameraCaptureDialogState();
}

class _CameraCaptureDialogState extends State<CameraCaptureDialog> 
 with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late CameraBloc _cameraBloc;

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

    _cameraBloc.add(OnLoadPredictModelEvent());
  }

  Future<void> _closeDialog() async {
    await _controller.reverse();
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _cameraBloc.close();
    _controller.dispose();
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
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                     
                    ContainerIcon(),
              
                    const SizedBox(height: 20),
      
                    TitleDescription(
                      title: 'Upload File',
                      description: 'Upload your image or video here. \n Make sure the file is clear and valid.',
                    ),
              
                    const SizedBox(height: 20),
              
                    UploadTile(fileName: widget.file.uri.pathSegments.last),
              
                    const SizedBox(height: 20),
              
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
              
                          Cancelbtn(onPressed: (){_closeDialog();}),
                          const SizedBox(width: 20),
                          SubmitBtn(filePath: widget.file.path,onPressed: _closeDialog),
              
                      ],
                    )
              
                ],
              ),
            ),
          ),
         ),
    );
  }
}