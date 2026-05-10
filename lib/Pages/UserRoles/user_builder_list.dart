import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/UserRoles/UserCard/user_list_card.dart';
import 'package:fyp_project/blocs/users/user_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Exception.dart';
import 'package:fyp_project/config/Components/Custom_Loading.dart';
import 'package:fyp_project/utils/enums.dart';

class UserListBuilder extends StatefulWidget {
  const UserListBuilder({super.key});

  @override
  State<UserListBuilder> createState() => _UserListBuilderState();
}

class _UserListBuilderState extends State<UserListBuilder> 
with SingleTickerProviderStateMixin{
  late AnimationController _controller; 

  @override
  void initState() {
    super.initState();
   _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 700))..forward();
  }

  @override
  void dispose()
  {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return
        Expanded(
          child: BlocBuilder<UserBloc, UserState>(
            buildWhen: (previous, current) => 
            current.searchUsersList!=previous.searchUsersList ||
            current.usersLoadingStatus != previous.usersLoadingStatus,
            builder: (context, state) {
              if (state.usersLoadingStatus == UsersLoadingStatus.loading) {
                 return Center(child: CustomLoading(color: theme.primaryColor));
              } else if (state.usersLoadingStatus == UsersLoadingStatus.error) {
                return Center(child: CustomException(message: state.error));
              } else if(state.searchUsersList.isEmpty) { 
                return Center(child: CustomException(message: 'No User found!'));
              }
               return ListView.builder(
                    itemCount:state.searchUsersList.length,
                    itemBuilder: (context, index) {
                       final animation = Tween<double>(begin: 0, end: 1).animate(
                      CurvedAnimation(
                        parent: _controller,
                        curve: Interval(0.1 * index, 1, curve: Curves.easeOut),
                      ),
                    );

                      return 
                        FadeTransition(
                          opacity: animation,
                          child: ScaleTransition(
                          scale: animation,
                          child: UserListCard(userModel: state.searchUsersList[index])));
                    },
                  );
            },
          ),
        );
  }
}
