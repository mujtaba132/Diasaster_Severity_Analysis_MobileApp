import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/blocs/local_severity/local_severity_bloc.dart';
import 'package:fyp_project/config/Components/CustomSnackbar.dart';
import 'package:fyp_project/config/Components/Custom_Btns.dart';
import 'package:fyp_project/utils/enums.dart';

class UploadBtn extends StatelessWidget {
  final MediaModel model;
  final VoidCallback onPressed;
  const UploadBtn({super.key,required this.model,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<LocalSeverityBloc, LocalSeverityState>(
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
      child: BlocBuilder<LocalSeverityBloc, LocalSeverityState>(
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
                context.read<LocalSeverityBloc>().add(OnSubmitRequestEvent(model: model));
               }
            ),
          );
        },
      ),
    );
  }
}
