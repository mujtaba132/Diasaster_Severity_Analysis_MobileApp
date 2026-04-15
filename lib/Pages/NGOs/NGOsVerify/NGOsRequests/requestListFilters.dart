import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/request_ngo/request_ngo_bloc.dart';
import 'package:fyp_project/config/Components/Custom_filterChip.dart';

import 'package:fyp_project/utils/enums.dart';

class NGOsFilters extends StatelessWidget {
  const NGOsFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        BlocBuilder<RequestNgoBloc, RequestNgoState>(
          buildWhen: (previous, current) => previous.ngosFilterType!=current.ngosFilterType,
          builder: (context, state) {
            return CustomFilterChip(
             title: 'All',
             isSelected: state.ngosFilterType == NGOsFilterType.all,
             onTap: (){
                  context.read<RequestNgoBloc>().add(OnChnageNGOFilterEvent(ngosFilterType: NGOsFilterType.all));
             });
          },
        ),

          BlocBuilder<RequestNgoBloc, RequestNgoState>(
          buildWhen: (previous, current) => previous.ngosFilterType!=current.ngosFilterType,
          builder: (context, state) {
            return CustomFilterChip(
             title: 'Verified',
             isSelected: state.ngosFilterType == NGOsFilterType.verified,
             onTap: (){
                  context.read<RequestNgoBloc>().add(OnChnageNGOFilterEvent(ngosFilterType: NGOsFilterType.verified));
             });
          },
        ),

          BlocBuilder<RequestNgoBloc, RequestNgoState>(
          buildWhen: (previous, current) => previous.ngosFilterType!=current.ngosFilterType,
          builder: (context, state) {
            return CustomFilterChip(
             title: 'UnVerified',
             isSelected: state.ngosFilterType == NGOsFilterType.unverified,
             onTap: (){
                  context.read<RequestNgoBloc>().add(OnChnageNGOFilterEvent(ngosFilterType: NGOsFilterType.unverified));
             });
          },
        ),
      ],
    );
  }
}
