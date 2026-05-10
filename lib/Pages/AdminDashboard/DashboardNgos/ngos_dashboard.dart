import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Model/dashboardModels/NgoModel/ngo_model.dart';
import 'package:fyp_project/Pages/AdminDashboard/DashboardCard/dashboard_card.dart';
import 'package:fyp_project/Pages/AdminDashboard/admin_dashboard.dart';
import 'package:fyp_project/blocs/admin_dashboard/admin_dashboard_bloc.dart';

class NgosDashboard extends StatelessWidget {
  const NgosDashboard({super.key});

  @override
Widget build(BuildContext context) {
  return BlocBuilder<AdminDashboardBloc, AdminDashboardState>(
    buildWhen: (previous, current) =>
        current.ngoModel != previous.ngoModel,
    builder: (context, state) {

      final DashboardNgoModel ngoModel = state.ngoModel;

      return SizedBox(
        height: 180,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 4),

          itemCount: 4,

          separatorBuilder: (context, index) =>
              const SizedBox(width: 14),

          itemBuilder: (context, index) {

            final List<DashboardCard> cards = [

              DashboardCard(
                title: "Registered NGOs",
                value: padFromLeft(ngoModel.verifiedNGOs),
                icon: Icons.groups_rounded,
                color: Colors.blue,
              ),

              DashboardCard(
                title: "Not Verified",
                value: padFromLeft(ngoModel.nonVerifyNGOs),
                icon: Icons.gpp_bad_rounded,
                color: Colors.orange,
              ),

              DashboardCard(
                title: "NGO Requests",
                value: padFromLeft(ngoModel.totalNgos),
                icon: Icons.assessment_outlined,
                color: Colors.purple,
              ),

              DashboardCard(
                title: "Unread Requests",
                value: "05",
                icon: Icons.notifications_active_rounded,
                color: Colors.red,
                isAlert: true,
              ),
            ];

            return SizedBox(
              width: 220,
              child: cards[index],
            );
          },
        ),
      );
    },
  );
}}
