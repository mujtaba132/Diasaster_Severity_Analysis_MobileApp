import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/bloc/admin_feed_bloc.dart';
import 'package:fyp_project/config/Components/Custom_SearchFeild.dart';

class AdminFeedSearch extends StatelessWidget {
  final TextEditingController textEditingController;
  const AdminFeedSearch({super.key, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminFeedBloc, AdminFeedState>(
      buildWhen: (previous, current) => current.searchQuery!=previous.searchQuery,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: AppSearchField(
            controller: textEditingController,
            onChanged: (query) {
                  context.read<AdminFeedBloc>().add(OnChangeSearchFeildEvent(query: query));
          }),
        );
      },
    );
  }
}
