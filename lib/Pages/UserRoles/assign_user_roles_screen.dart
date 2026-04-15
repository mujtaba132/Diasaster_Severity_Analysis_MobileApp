import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/UserRoles/assign_user_search.dart';
import 'package:fyp_project/Pages/UserRoles/user_builder_list.dart';
import 'package:fyp_project/blocs/users/user_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Appbar.dart';
import 'package:fyp_project/main.dart';


class AssignUserRoles extends StatefulWidget {
  const AssignUserRoles({super.key});

  @override
  State<AssignUserRoles> createState() => _AssignUserRolesState();
}

class _AssignUserRolesState extends State<AssignUserRoles> {
  late UserBloc _userBloc;
  late TextEditingController _textEditingController;

 @override
  void initState() {
    super.initState();
    _userBloc=UserBloc(getit());
    _textEditingController=TextEditingController();
    _userBloc.add(OnLoadUserEvent());
  }

  @override
  void dispose()
  {
    _userBloc.close();
    _textEditingController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _userBloc,
      child: Scaffold(
        appBar: CustomAppbar(title: 'User Roles'),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            children: [

              const SizedBox(height: 10),

              UserSearchFeild(textEditingController: _textEditingController),

              const SizedBox(height: 20),

              UserListBuilder(),

            ],
          ),
        ),
      ),
    );
  }
}
