import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/request_ngo/request_ngo_bloc.dart';
import 'package:fyp_project/config/Components/Custom_filterChip.dart';
import 'package:fyp_project/utils/enums.dart';

class NGOsFilters extends StatelessWidget {
  const NGOsFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestNgoBloc, RequestNgoState>(
      buildWhen: (previous, current) =>
          previous.ngosFilterType != current.ngosFilterType,
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            children: [
              CustomFilterChip(
                title: 'All',
                icon: Icons.groups_rounded,
                color: Colors.blue,
                isSelected: state.ngosFilterType == NGOsFilterType.all,
                onTap: () {
                  context.read<RequestNgoBloc>().add(
                    OnChnageNGOFilterEvent(ngosFilterType: NGOsFilterType.all),
                  );
                },
              ),

              const SizedBox(width: 12),

              CustomFilterChip(
                title: 'Verified',
                icon: Icons.verified_user_rounded,
                color: Colors.green,
                isSelected: state.ngosFilterType == NGOsFilterType.verified,
                onTap: () {
                  context.read<RequestNgoBloc>().add(
                    OnChnageNGOFilterEvent(
                      ngosFilterType: NGOsFilterType.verified,
                    ),
                  );
                },
              ),

              const SizedBox(width: 12),

              CustomFilterChip(
                title: 'UnVerified',
                icon: Icons.gpp_bad_rounded,
                color: Colors.redAccent,
                isSelected: state.ngosFilterType == NGOsFilterType.unverified,
                onTap: () {
                  context.read<RequestNgoBloc>().add(
                    OnChnageNGOFilterEvent(
                      ngosFilterType: NGOsFilterType.unverified,
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
