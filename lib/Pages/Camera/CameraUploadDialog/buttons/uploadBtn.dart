import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/camera/camera_bloc.dart';
import 'package:fyp_project/config/Components/CustomSnackbar.dart';
import 'package:fyp_project/config/Components/Custom_Btns.dart';
import 'package:fyp_project/utils/enums.dart';

class UploadBtn extends StatelessWidget {
  final String filePath;
  final VoidCallback onPressed;
  const UploadBtn({super.key,required this.filePath,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<CameraBloc, CamerasState>(
      listenWhen: (previous, current) =>
          previous.submitRequestStatus != current.submitRequestStatus,
      listener: (context, state) {
        if (state.submitRequestStatus ==SubmitRequestStatus.error) {
           return CustomSnackBar.error(state.error);
        } else if(state.submitRequestStatus ==SubmitRequestStatus.success)
        {
            onPressed();
            CustomSnackBar.success('Data submitted successfully');
        }
      },
      child: BlocBuilder<CameraBloc, CamerasState>(
        buildWhen: (previous, current) =>
          previous.submitRequestStatus != current.submitRequestStatus,
        builder: (context, state) {
          return Expanded(
            child: Theme_Button( 
              bgColor: theme.primaryColor,
              textColor: theme.cardColor,
              height: 43,
              width: double.infinity,
              isLoading: state.submitRequestStatus ==SubmitRequestStatus.loading,
              text: 'Upload',
              onclick:
              () {
                context.read<CameraBloc>().add(OnSubmitRequestEvent(filePath: filePath));
               }
            ),
          );
        },
      ),
    );
  }
}
