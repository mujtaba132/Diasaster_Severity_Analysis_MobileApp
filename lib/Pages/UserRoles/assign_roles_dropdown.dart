import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/users/user_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Dropdown.dart';
import 'package:fyp_project/utils/enums.dart';

class UserRoleDropDown extends StatefulWidget {
  final String userId;
  final Role userRole;
  const UserRoleDropDown({super.key,required this.userId,required this.userRole});

  @override
  State<UserRoleDropDown> createState() => _UserRoleDropDownState();
}

class _UserRoleDropDownState extends State<UserRoleDropDown> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.userRoleStatus != current.userRoleStatus,
      builder: (context, state) {
        return SizedBox(
          width: 90,
          height: 40,
          child: CustomDropdown<Role>(
            items: Role.values,
            value: widget.userRole,
            onChanged: (newRole) {
                context.read<UserBloc>().add(OnChangeUserRoleEvent(userId:widget.userId,userRole: newRole!));
            },
            itemLabel: (item) => item.name,
          ),
        );
      },
    );
  }
}
