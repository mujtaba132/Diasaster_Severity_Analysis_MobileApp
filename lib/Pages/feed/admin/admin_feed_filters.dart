import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/admin_feed/admin_feed_bloc.dart';
import 'package:fyp_project/config/Components/Custom_filterChip.dart';
import 'package:fyp_project/utils/enums.dart';

class AdminFeedFilterScreen extends StatelessWidget {
  const AdminFeedFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminFeedBloc, AdminFeedState>(
      buildWhen: (previous, current) =>
          previous.adminFeedFilter != current.adminFeedFilter,
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            children: [
              CustomFilterChip(
                title: "All",
                icon: Icons.dashboard_customize_rounded,
                color: Colors.blue,
                isSelected: state.adminFeedFilter == AdminFeedPostStatus.all,
                onTap: () {
                  context.read<AdminFeedBloc>().add(
                    OnChangePostFilterEvent(newFilter: AdminFeedPostStatus.all),
                  );
                },
              ),

              const SizedBox(width: 12),

              CustomFilterChip(
                title: "Pending",
                icon: Icons.pending_actions_rounded,
                color: Colors.orange,
                isSelected:
                    state.adminFeedFilter == AdminFeedPostStatus.pending,
                onTap: () {
                  context.read<AdminFeedBloc>().add(
                    OnChangePostFilterEvent(
                      newFilter: AdminFeedPostStatus.pending,
                    ),
                  );
                },
              ),

              const SizedBox(width: 12),

              CustomFilterChip(
                title: "Processing",
                icon: Icons.sync_rounded,
                color: Colors.deepPurple,
                isSelected:
                    state.adminFeedFilter == AdminFeedPostStatus.processing,
                onTap: () {
                  context.read<AdminFeedBloc>().add(
                    OnChangePostFilterEvent(
                      newFilter: AdminFeedPostStatus.processing,
                    ),
                  );
                },
              ),

              const SizedBox(width: 12),

              CustomFilterChip(
                title: "Approved",
                icon: Icons.verified_rounded,
                color: Colors.green,
                isSelected:
                    state.adminFeedFilter == AdminFeedPostStatus.approved,
                onTap: () {
                  context.read<AdminFeedBloc>().add(
                    OnChangePostFilterEvent(
                      newFilter: AdminFeedPostStatus.approved,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
