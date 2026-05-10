import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/AdminDashboard/DashboardCard/dashboard_status_card.dart';
import 'package:fyp_project/Pages/AdminDashboard/admin_dashboard.dart';
import 'package:fyp_project/blocs/admin_dashboard/admin_dashboard_bloc.dart';

class DashboardPosts extends StatelessWidget {
  const DashboardPosts({super.key});

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    return BlocBuilder<AdminDashboardBloc, AdminDashboardState>(
      buildWhen: (previous, current) => 
      previous.postModel!=current.postModel,
      builder: (context, state) {

        final model = state.postModel;
        return Row(
          children: [
            Expanded(
              child: StatusCard(
                title: "Approved Posts",
                value: padFromLeft(model.verifiedPosts),
                icon: Icons.verified_rounded,
                color: Colors.green,
              ),
            ),

            SizedBox(width: width * .03),

            Expanded(
              child: StatusCard(
                title: "Pending Requests",
                value: padFromLeft(model.nonVerifyPosts),
                icon: Icons.pending_rounded,
                color: Colors.orange,
              ),
            ),
          ],
        );
      },
    );
  }
}
