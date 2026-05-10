import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/AdminDashboard/DashboardCard/dashboard_ministat_card.dart';
import 'package:fyp_project/Pages/AdminDashboard/admin_dashboard.dart';
import 'package:fyp_project/blocs/admin_dashboard/admin_dashboard_bloc.dart';

class DashboardQuickStat extends StatelessWidget {
  const DashboardQuickStat({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return BlocBuilder<AdminDashboardBloc, AdminDashboardState>(
      buildWhen: (previous, current) => 
      previous.ngoModel!=current.ngoModel ||
      previous.postModel!=current.postModel,

      builder: (context, state) {

     final postModel = state.postModel;
     final ngoModel = state.ngoModel;

      int totalVerified = (postModel.verifiedPosts + ngoModel.verifiedNGOs);
      int totalPending = (postModel.nonVerifyPosts + ngoModel.nonVerifyNGOs);

        return Row(
          children: [
            Expanded(
              child: MiniStatCard(
                title: "Unread",
                value: "05",
                icon: Icons.mark_email_unread_rounded,
                color: Colors.red,
              ),
            ),

            SizedBox(width: width * .03),

            Expanded(
              child: MiniStatCard(
                title: "Pending",
                value: padFromLeft(totalPending),
                icon: Icons.pending_actions_rounded,
                color: Colors.orange,
              ),
            ),

            SizedBox(width: width * .03),

            Expanded(
              child: MiniStatCard(
                title: "Approved",
                value: padFromLeft(totalVerified),
                icon: Icons.verified_rounded,
                color: Colors.green,
              ),
            ),
          ],
        );
      },
    );
  }
}
