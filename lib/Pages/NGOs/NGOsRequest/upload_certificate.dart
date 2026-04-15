import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/register_ngo/register_ngo_bloc.dart';
import 'package:fyp_project/config/Components/Custom_UploadTile.dart';
import 'package:fyp_project/config/components/CustomSnackbar.dart';
import 'package:fyp_project/config/routes/routes_arguments/imagePreview_arguments.dart';
import 'package:fyp_project/config/routes/routes_name.dart';
import 'package:fyp_project/utils/enums.dart';

class CertificateUpload extends StatefulWidget {
  const CertificateUpload({super.key});

  @override
  State<CertificateUpload> createState() => _CertificateUploadState();
}

class _CertificateUploadState extends State<CertificateUpload> {
  @override
  Widget build(BuildContext context) {

    return BlocListener<RegisterNgoBloc, RegisterNgoState>(
      listenWhen: (previous, current) =>
          previous.uploadCertificateStatus != current.uploadCertificateStatus,
      listener: (BuildContext context, RegisterNgoState state) {
        if (state.uploadCertificateStatus == UploadCertificateStatus.error) {
          CustomSnackBar.error(state.error);
        }
      },
      child: BlocBuilder<RegisterNgoBloc, RegisterNgoState>(
        buildWhen: (previous, current) =>
            previous.fileName != current.fileName ||
            previous.uploadCertificateStatus != current.uploadCertificateStatus,
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              context.read<RegisterNgoBloc>().add(OnPickFileEvent());
            },
            child: UploadTile(
              fileName: state.fileName,
              status:
                  state.uploadCertificateStatus == UploadCertificateStatus.loading
                  ? UploadStatus.loading
                  : state.uploadCertificateStatus == UploadCertificateStatus.success
                  ? UploadStatus.success
                  : UploadStatus.initial,

              onUpload: () {
                context.read<RegisterNgoBloc>().add(OnUploadFileEvent());
              },

              onPreview: () {
                Navigator.pushNamed(context, RoutesName.imagePreviewScreen,arguments: ImagePreviewArguments(file: File(state.certificateFile)));
              },
            ),
          );
        },
      ),
    );
  }
}
