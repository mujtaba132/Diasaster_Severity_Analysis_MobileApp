import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/Pages/feed/disaster_feed/disaster_feed_list.dart';
import 'package:fyp_project/blocs/citizen/citizen_feed_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Exception.dart';
import 'package:fyp_project/config/Components/Custom_Loading.dart';
import 'package:fyp_project/utils/enums.dart';

class CitizenFeedList extends StatelessWidget {
  const CitizenFeedList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return  Expanded(
                child: BlocBuilder<CitizenFeedBloc, CitizenFeedState>(
                  buildWhen: (previous, current) =>
                      previous.searchedFeed != current.searchedFeed ||
                      previous.citizenFeedStatus != current.citizenFeedStatus,
                  builder: (context, state) {
                    if (state.citizenFeedStatus == CitizenFeedstatus.loading) {
                      return Center(child: CustomLoading(color: theme.primaryColor));
                    } else if (state.citizenFeedStatus == CitizenFeedstatus.error) {
                      return Center(child: CustomException(message: state.error));
                    } else if (state.citizenFeed.isEmpty || state.searchedFeed.isEmpty) {
                      return Center(child: CustomException(message: "No Feed Available."));
                    }
                
                    return DisasterFeedList(
                      reports: state.searchedFeed,
                      role: Role.citizen,
                      selector: (context, model) {
                             return context.select<CitizenFeedBloc, MediaModel>(
                                 (bloc) => bloc.state.citizenFeedMap[model.reportId] ?? model,
                             );
                      },
                    );
                  },
                ),
              );
  }
}