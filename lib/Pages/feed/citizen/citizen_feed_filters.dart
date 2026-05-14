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
      buildWhen: (previous, current) =>
          previous.citizenFeedFilter != current.citizenFeedFilter,
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            children: [
              CustomFilterChip(
                title: "All",
                icon: Icons.dashboard_rounded,
                color: Colors.blue,
                isSelected: state.citizenFeedFilter == CitizenFeedFilters.all,
                onTap: () {
                  context.read<CitizenFeedBloc>().add(
                    OnChangeFeedFilterEvent(
                      citizenFeedFilter: CitizenFeedFilters.all,
                    ),
                  );
                },
              ),

              const SizedBox(width: 12),

              CustomFilterChip(
                title: "Severe",
                icon: Icons.warning_amber_rounded,
                color: Colors.redAccent,
                isSelected:
                    state.citizenFeedFilter == CitizenFeedFilters.severe,
                onTap: () {
                  context.read<CitizenFeedBloc>().add(
                    OnChangeFeedFilterEvent(
                      citizenFeedFilter: CitizenFeedFilters.severe,
                    ),
                  );
                },
              ),

              const SizedBox(width: 12),

              CustomFilterChip(
                title: "Mild",
                icon: Icons.health_and_safety_rounded,
                color: Colors.orange,
                isSelected: state.citizenFeedFilter == CitizenFeedFilters.mild,
                onTap: () {
                  context.read<CitizenFeedBloc>().add(
                    OnChangeFeedFilterEvent(
                      citizenFeedFilter: CitizenFeedFilters.mild,
                    ),
                  );
                },
              ),

              const SizedBox(width: 12),

              CustomFilterChip(
                title: "No Damage",
                icon: Icons.verified_rounded,
                color: Colors.green,
                isSelected:
                    state.citizenFeedFilter == CitizenFeedFilters.nodamage,
                onTap: () {
                  context.read<CitizenFeedBloc>().add(
                    OnChangeFeedFilterEvent(
                      citizenFeedFilter: CitizenFeedFilters.nodamage,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
