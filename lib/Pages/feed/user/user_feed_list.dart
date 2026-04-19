import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/Pages/feed/disaster_feed/disaster_feed_list.dart';
import 'package:fyp_project/blocs/user_feed/user_feed_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Exception.dart';
import 'package:fyp_project/config/Components/Custom_Loading.dart';
import 'package:fyp_project/utils/enums.dart';

class UserFeedList extends StatelessWidget {
  const UserFeedList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<UserFeedBloc, UserFeedState>(
        buildWhen: (previous, current) =>
            previous.userFeedStatus != current.userFeedStatus,
        builder: (context, state) {
          if (state.userFeedStatus == UserFeedstatus.loading) {
            return Center(child: CustomLoading(color: theme.primaryColor));
          } else if (state.userFeedStatus == UserFeedstatus.error) {
            return Center(child: CustomException(message: state.error));
          } else if (state.userFeed.isEmpty) {
            return Center(child: CustomException(message: "You dont post any content relevent to disaster."));
          }

          return DisasterFeedList(
            reports: state.userFeed,
            role: Role.user,
            selector: (context, report) {
                return context.select<UserFeedBloc,MediaModel>((bloc) {
                    return  bloc.state.userFeedMap[report.reportId] ?? report;
                });
            },
          );
        },
      );
  }
}