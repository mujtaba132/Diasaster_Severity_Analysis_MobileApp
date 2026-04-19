import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/Pages/feed/disaster_feed/disaster_feed_list.dart';
import 'package:fyp_project/blocs/bloc/admin_feed_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Exception.dart';
import 'package:fyp_project/config/Components/Custom_Loading.dart';
import 'package:fyp_project/utils/enums.dart';

class AdminFeedList extends StatelessWidget {
  const AdminFeedList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return  Expanded(
            child: BlocBuilder<AdminFeedBloc, AdminFeedState>(
              buildWhen: (previous, current) =>
                  previous.searchedFeed != current.searchedFeed || 
                  previous.adminFeedStatus != current.adminFeedStatus,
              builder: (context, state) {
                if (state.adminFeedStatus == AdminFeedstatus.loading) {
                  return Center(child: CustomLoading(color: theme.primaryColor));
                } else if (state.adminFeedStatus == AdminFeedstatus.error) {
                  return Center(child: CustomException(message: state.error));
                } else if (state.searchedFeed.isEmpty) {
                  return Center(child: CustomException(message: "Dont have any content available relevent to disaster."));
                }
            
                return DisasterFeedList(
                  reports: state.searchedFeed,
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