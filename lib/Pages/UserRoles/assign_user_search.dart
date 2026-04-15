import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/users/user_bloc.dart';
import 'package:fyp_project/config/Components/Custom_SearchFeild.dart';

class UserSearchFeild extends StatelessWidget {
  final TextEditingController textEditingController;
  const UserSearchFeild({super.key, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => current.searchText!=previous.searchText,
      builder: (context, state) {
        return  AppSearchField(
            controller: textEditingController,
            hintText: 'search',
            onChanged: (query) {
              print(query);
              context.read<UserBloc>().add(OnSearchUserEvent(searchText: query));
            },
          );
      },
    );
  }
}
