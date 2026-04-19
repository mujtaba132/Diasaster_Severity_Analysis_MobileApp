import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/bloc/admin_feed_bloc.dart';
import 'package:fyp_project/config/Components/Custom_filterChip.dart';
import 'package:fyp_project/utils/enums.dart';

class AdminFeedFilterScreen extends StatelessWidget {
  const AdminFeedFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminFeedBloc, AdminFeedState>(
      buildWhen: (previous, current) => previous.adminFeedFilter!=current.adminFeedFilter,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomFilterChip(
              title: "All", 
              isSelected: state.adminFeedFilter == AdminFeedPostStatus.all, 
              onTap: () {
              context.read<AdminFeedBloc>().add(OnChangePostFilterEvent(newFilter: AdminFeedPostStatus.all));
            }),
            CustomFilterChip(
              title: "Pending", 
              isSelected: state.adminFeedFilter == AdminFeedPostStatus.pending, 
              onTap: () {
              context.read<AdminFeedBloc>().add(OnChangePostFilterEvent(newFilter: AdminFeedPostStatus.pending));
            }),
            CustomFilterChip(
              title: "Processing", 
              isSelected: state.adminFeedFilter == AdminFeedPostStatus.processing, 
              onTap: () {
              context.read<AdminFeedBloc>().add(OnChangePostFilterEvent(newFilter: AdminFeedPostStatus.processing));
            }),
            CustomFilterChip(
              title: "Approved",
              isSelected: state.adminFeedFilter == AdminFeedPostStatus.approved, 
              onTap: () {
              context.read<AdminFeedBloc>().add(OnChangePostFilterEvent(newFilter: AdminFeedPostStatus.approved));
            }),
          ],
        );
      },
    );
  }
}
