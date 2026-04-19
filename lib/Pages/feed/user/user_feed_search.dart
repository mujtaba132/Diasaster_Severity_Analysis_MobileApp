import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/user_feed/user_feed_bloc.dart';
import 'package:fyp_project/config/Components/Custom_SearchFeild.dart';

class UserFeedSearch extends StatelessWidget {
  final TextEditingController textEditingController;
  const UserFeedSearch({super.key, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFeedBloc, UserFeedState>(
      buildWhen: (previous, current) => current.searchQuery!=previous.searchQuery,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: AppSearchField(
            controller: textEditingController,
            onChanged: (query) {
                  context.read<UserFeedBloc>().add(OnSearchUserFeedEvent(query: query));
          }),
        );
      },
    );
  }
}
