import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/blocs/bloc/admin_feed_bloc.dart';
import 'package:fyp_project/config/Components/CustomSnackbar.dart';
import 'package:fyp_project/config/Components/Custom_Dropdown.dart';
import 'package:fyp_project/utils/enums.dart';

class FeedSeverityDropdown extends StatelessWidget {
  final MediaModel report;
  const FeedSeverityDropdown({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdminFeedBloc, AdminFeedState>(
      listener: (context, state) {
          if(state.adminFeedStatus == AdminFeedstatus.error)
          {
            return CustomSnackBar.error(state.error);
          }
      },
      child: BlocBuilder<AdminFeedBloc, AdminFeedState>(
        buildWhen: (previous, current) =>
            previous.adminPoststatus != current.adminPoststatus,
        builder: (context, state) {
          return SizedBox(
            width: 110,
            height: 45,
            child: CustomDropdown<CitizenFeedStatus>(
              items: CitizenFeedStatus.values,
              value: report.status,
              onChanged: (newStatus) {
                context.read<AdminFeedBloc>().add(
                  OnChangePostStatusEvent(
                    newStatus: newStatus!,
                    reportId: report.reportId!,
                  ),
                );
              },
              itemLabel: (value) => value.name,
            ),
          );
        },
      ),
    );
  }
}
