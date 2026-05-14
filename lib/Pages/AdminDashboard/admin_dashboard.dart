// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/AdminDashboard/DashboardCard/dashboard_anlysis_card.dart';
import 'package:fyp_project/Pages/AdminDashboard/DashboardNgos/ngos_dashboard.dart';
import 'package:fyp_project/Pages/AdminDashboard/DashboardPosts/dashboard_posts.dart';
import 'package:fyp_project/Pages/AdminDashboard/DashboardQuickStat/dashboard_quick_stat.dart';
import 'package:fyp_project/Pages/AdminDashboard/DashboradUsers/dashboard_users.dart';
import 'package:fyp_project/Pages/AdminDashboard/admin_section_title.dart';
import 'package:fyp_project/blocs/admin_dashboard/admin_dashboard_bloc.dart';
import 'package:fyp_project/main.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  late AdminDashboardBloc _adminDashboardBloc;

  @override
  void initState() {
    super.initState();
    _adminDashboardBloc = getit<AdminDashboardBloc>();
    _adminDashboardBloc.add(OnLoadNgoDashboardEvent());
    _adminDashboardBloc.add(OnLoadPostDashboardEvent());
    _adminDashboardBloc.add(OnLoadUsersDashboardEvent());
    _adminDashboardBloc.add(OnLoadTotalDonationEvent());
  }

  @override
  void dispose() {
    _adminDashboardBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;

    return BlocProvider.value(
      value: _adminDashboardBloc,
      child: Scaffold(
        backgroundColor: isDark
            ? const Color(0xff0B1120)
            : const Color(0xffF8FAFC),

        body: SafeArea(
          child: Column(
            children: [
              /// 🔵 FIXED TOP SECTION
              Padding(
                padding: EdgeInsets.all(width * .04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// TOP HEADER
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(width * .055),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: isDark
                              ? [
                                  const Color(0xff1E293B),
                                  const Color(0xff0F172A),
                                  const Color(0xff172554),
                                ]
                              : [
                                  theme.colorScheme.primary,
                                  theme.colorScheme.primary.withOpacity(.85),
                                  theme.colorScheme.secondary,
                                ],
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.space_dashboard_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(width: width * .04),
                          Expanded(
                            child: Text(
                              "Admin Dashboard",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * .05,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: width * .05),

                    /// QUICK STATS (FIXED)
                    const DashboardQuickStat(),
                  ],
                ),
              ),

              /// 🔴 SCROLLABLE SECTION ONLY
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: width * .04),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: width * .04),

                      SectionTitle(
                        title: "NGO Analytics",
                        icon: Icons.volunteer_activism_rounded,
                      ),

                      SizedBox(height: width * .04),

                      NgosDashboard(),

                      SizedBox(height: width * .07),

                      SectionTitle(
                        title: "Donations",
                        icon: Icons.favorite_rounded,
                      ),

                      SizedBox(height: width * .04),

                      BlocBuilder<AdminDashboardBloc, AdminDashboardState>(
                        buildWhen: (previous, current) =>
                            current.totalDonation != previous.totalDonation,
                        builder: (context, state) {
                          return WideAnalyticsCard(
                            title: "Total Donations Received",
                            value: "Rs. ${state.totalDonation}",
                            subTitle:
                                "All donations collected from verified campaigns",
                            icon: Icons.payments_rounded,
                            color: Colors.green,
                          );
                        },
                      ),

                      SizedBox(height: width * .07),

                      SectionTitle(
                        title: "Users Overview",
                        icon: Icons.people_alt_rounded,
                      ),

                      SizedBox(height: width * .04),

                      DashboardUsers(),

                      SizedBox(height: width * .07),

                      SectionTitle(
                        title: "Disaster Posts",
                        icon: Icons.warning_amber_rounded,
                      ),

                      SizedBox(height: width * .04),

                      DashboardPosts(),

                      SizedBox(height: width * .08),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String padFromLeft(int value) {
  return value.toString().padLeft(2, '0');
}
