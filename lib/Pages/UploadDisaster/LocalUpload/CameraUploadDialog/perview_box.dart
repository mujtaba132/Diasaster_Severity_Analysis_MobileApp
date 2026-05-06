import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/local_severity/local_severity_bloc.dart';
import 'package:fyp_project/config/Components/CustomSnackbar.dart';
import 'package:fyp_project/config/Components/Custom_UploadTile.dart';
import 'package:fyp_project/config/routes/routes_arguments/imagePreview_arguments.dart';
import 'package:fyp_project/config/routes/routes_arguments/videoPreview_arguments.dart';
import 'package:fyp_project/config/routes/routes_name.dart';
import 'package:fyp_project/utils/enums.dart';

class PerviewBox extends StatelessWidget {
  final File file;
  const PerviewBox({super.key, required this.file});

  @override
  Widget build(BuildContext context) {

    return BlocListener<LocalSeverityBloc, LocalSeverityState>(
      listenWhen: (previous, current) => previous.mediaUploadStatus != current.mediaUploadStatus,
      listener: (context, state) {
            if(state.mediaUploadStatus == MediaUploadStatus.error)
            {
              return CustomSnackBar.error(state.error);
            } else if(state.mediaUploadStatus == MediaUploadStatus.success)
            {
              return CustomSnackBar.success('Data Uploaded Successfully');
            }
      },
      child: BlocBuilder<LocalSeverityBloc, LocalSeverityState>(
        buildWhen: (previous, current) => previous.mediaUploadStatus != current.mediaUploadStatus,
        builder: (context, state) {
          return UploadTile(
              fileName: file.uri.pathSegments.last, 
              status: state.mediaUploadStatus == MediaUploadStatus.loading ?
              UploadStatus.loading :
              state.mediaUploadStatus == MediaUploadStatus.success ?
              UploadStatus.success: UploadStatus.initial,
              onUpload: () {
                  context.read<LocalSeverityBloc>().add(OnUploadMediaEvent(file: file));
              },
              onPreview: () {
                  file.path.endsWith('.mp4') || file.path.endsWith('.mov')
                    ? Navigator.pushNamed(
                        context,
                        RoutesName.videoPreviewScreen,
                        arguments: VideoPreviewArguments(file: file),
                      )
                    : Navigator.pushNamed(
                        context,
                        RoutesName.imagePreviewScreen,
                        arguments: ImagePreviewArguments(file: file),
                      );
              });
        },
      ));
  }
}


 