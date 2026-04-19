import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/citizen/citizen_feed_bloc.dart';
import 'package:fyp_project/config/Components/Custom_SearchFeild.dart';

class CitizenFeedSearch extends StatelessWidget {
  final TextEditingController textEditingController;
  const CitizenFeedSearch({super.key, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitizenFeedBloc, CitizenFeedState>(
      buildWhen: (previous, current) => current.searchQuery!=previous.searchQuery,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: AppSearchField(
            controller: textEditingController,
            onChanged: (value) {
                  context.read<CitizenFeedBloc>().add(OnSearchFeedEvent(query: value));
          }),
        );
      },
    );
  }
}
