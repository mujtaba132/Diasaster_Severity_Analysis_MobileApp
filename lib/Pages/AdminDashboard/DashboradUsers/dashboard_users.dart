import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/AdminDashboard/DashboardCard/dashboard_card.dart';
import 'package:fyp_project/Pages/AdminDashboard/admin_dashboard.dart';
import 'package:fyp_project/blocs/admin_dashboard/admin_dashboard_bloc.dart';

class DashboardUsers extends StatelessWidget {
  const DashboardUsers({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AdminDashboardBloc, AdminDashboardState>(
      buildWhen: (previous, current) =>
          previous.userModel != current.userModel ||
          previous.postModel != current.postModel,

      builder: (context, state) {

        final model = state.userModel;

        final List<DashboardCard> cards = [

          DashboardCard(
            title: "Total Users",
            value: padFromLeft(model.totalUsers),
            icon: Icons.group_rounded,
            color: Colors.cyan,
          ),

          DashboardCard(
            title: "Admins",
            value: padFromLeft(model.totalAdmins),
            icon: Icons.admin_panel_settings_rounded,
            color: Colors.deepOrange,
          ),

          DashboardCard(
            title: "Normal Users",
            value: padFromLeft(model.totalNormalUsers),
            icon: Icons.person_rounded,
            color: Colors.indigo,
          ),

          DashboardCard(
            title: "Posts Uploaded",
            value: padFromLeft(state.postModel.totalPosts),
            icon: Icons.post_add_rounded,
            color: Colors.teal,
          ),
        ];

        return SizedBox(
          height: 180,

          child: ListView.separated(
            scrollDirection: Axis.horizontal,

            padding: const EdgeInsets.symmetric(horizontal: 4),

            itemCount: cards.length,

            separatorBuilder: (context, index) =>
                const SizedBox(width: 14),

            itemBuilder: (context, index) {
              return SizedBox(
                width: 220,
                child: cards[index],
              );
            },
          ),
        );
      },
    );
  }
}