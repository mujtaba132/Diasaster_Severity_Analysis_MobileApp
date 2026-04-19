import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/citizen/citizen_feed_bloc.dart';
import 'package:fyp_project/config/Components/Custom_filterChip.dart';
import 'package:fyp_project/utils/enums.dart';

class CitizenFeedFiltersScreen extends StatelessWidget {
  const CitizenFeedFiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitizenFeedBloc, CitizenFeedState>(
      buildWhen: (previous, current) => previous.citizenFeedFilter!=current.citizenFeedFilter,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomFilterChip(
              title: "All", 
              isSelected: state.citizenFeedFilter == CitizenFeedFilters.all, 
              onTap: () {
              context.read<CitizenFeedBloc>().add(OnChangeFeedFilterEvent(citizenFeedFilter: CitizenFeedFilters.all));
            }),
            CustomFilterChip(
              title: "Severe", 
              isSelected: state.citizenFeedFilter == CitizenFeedFilters.severe, 
              onTap: () {
              context.read<CitizenFeedBloc>().add(OnChangeFeedFilterEvent(citizenFeedFilter: CitizenFeedFilters.severe));
            }),
            CustomFilterChip(
              title: "Mild", 
              isSelected: state.citizenFeedFilter == CitizenFeedFilters.mild, 
              onTap: () {
              context.read<CitizenFeedBloc>().add(OnChangeFeedFilterEvent(citizenFeedFilter: CitizenFeedFilters.mild));
            }),
            CustomFilterChip(
              title: "No_damage",
              isSelected: state.citizenFeedFilter == CitizenFeedFilters.nodamage, 
              onTap: () {
              context.read<CitizenFeedBloc>().add(OnChangeFeedFilterEvent(citizenFeedFilter: CitizenFeedFilters.nodamage));
            }),
          ],
        );
      },
    );
  }
}
