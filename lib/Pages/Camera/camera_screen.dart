import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/Camera/CameraUploadDialog/camera_upload_dialog.dart';
import 'package:fyp_project/blocs/camera/camera_bloc.dart';
import 'package:fyp_project/config/Components/CustomSnackbar.dart';
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
    return BlocProvider.value(
      value: _cameraBloc,
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: BlocListener<CameraBloc, CamerasState>(
              listenWhen: (previous, current) =>
                  previous.captureFile != current.captureFile,
              listener: (context, state) {
                if (state.error.isNotEmpty) {
                  return CustomSnackBar.error(state.error);
                } else if(state.captureFile!=null)
                {
                    showUploadDialog(context: context, file: state.captureFile!);
                }
              },

              child: CameraAwesomeBuilder.awesome(
                topActionsBuilder: (state) => AwesomeTopActions(
                  state: state,
                  children: [
                         AwesomeFlashButton(state: state),

                         if(state is PhotoCameraState)
                         AwesomeAspectRatioButton(state: state),

                         IconButton(
                          onPressed: (){
                            context.read<CameraBloc>().add(OnPickedMediaEvent());
                          }, 
                          icon: Icon(Icons.photo_library),color: Colors.white)
                  ],
                  ),
                saveConfig: SaveConfig.photoAndVideo(),
                onMediaTap: (event) {
                  context.read<CameraBloc>().add(
                    OnCaptureMediaEvent(mediaCapture: event),
                  );
                },
                availableFilters: [],
                onMediaCaptureEvent: (event) {
                  context.read<CameraBloc>().add(
                    OnCaptureMediaEvent(mediaCapture: event),
                  );
                },
              ),
            ),
          );
        }
      ),
    );
  }
}
