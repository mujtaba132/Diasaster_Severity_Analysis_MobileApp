import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/Pages/feed/disaster_feed/disaster_feed_list.dart';
import 'package:fyp_project/blocs/bloc/admin_feed_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Exception.dart';
import 'package:fyp_project/config/Components/Custom_Loading.dart';
import 'package:fyp_project/main.dart';
import 'package:fyp_project/utils/enums.dart';

class AdminFeedListScreen extends StatefulWidget {
  const AdminFeedListScreen({super.key});

  @override
  State<AdminFeedListScreen> createState() => _AdminFeedListScreenState();
}

class _AdminFeedListScreenState extends State<AdminFeedListScreen> {
  late AdminFeedBloc _adminFeedBloc;

  @override
  void initState() {
    super.initState();
    _adminFeedBloc = AdminFeedBloc(getit())..add(OnAdminFeedLoadEvent());
  }

  @override
  void dispose() {
    _adminFeedBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider.value(
      value: _adminFeedBloc,
      child: BlocBuilder<AdminFeedBloc, AdminFeedState>(
        buildWhen: (previous, current) =>
            previous.adminFeed != current.adminFeed || 
            previous.adminFeedStatus != current.adminFeedStatus,
        builder: (context, state) {
          if (state.adminFeedStatus == AdminFeedstatus.loading) {
            return Center(child: CustomLoading(color: theme.primaryColor));
          } else if (state.adminFeedStatus == AdminFeedstatus.error) {
            return Center(child: CustomException(message: state.error));
          } else if (state.adminFeed.isEmpty) {
            return Center(child: CustomException(message: "Dont have any content available relevent to disaster."));
          }

          return DisasterFeedList(
            reports: state.adminFeed,
            role: Role.admin,
            selector: (context, model) {
                   return context.select<AdminFeedBloc,MediaModel>(
                    (bloc) => bloc.state.adminFeedMap[model.reportId] ?? model);
            },
          );
        },
      ),
    );
  }
}
