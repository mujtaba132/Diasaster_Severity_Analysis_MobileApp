part of 'user_bloc.dart';


class UserState extends Equatable{

  final List<UserModel> usersList;
  final List<UserModel> searchUsersList;
  final UsersLoadingStatus usersLoadingStatus;
  final UserRoleStatus userRoleStatus;
  final String searchText;
  final String error;

  const UserState({
    this.usersList= const [],
    this.searchUsersList= const [],
    this.usersLoadingStatus = UsersLoadingStatus.initail,
    this.userRoleStatus = UserRoleStatus.initail,
    this.searchText='',
    this.error=''
    });
  

  UserState copyWith(
    {List<UserModel>? newUserList,
    List<UserModel>? newSearchUserList,
    UsersLoadingStatus? newUsersLoadingStatus,
    UserRoleStatus? newUserRoleStatus,
    String? newSearchText,
    String? newError})
  {
      return 
          UserState(
            usersList: newUserList ?? usersList,
            searchUsersList: newSearchUserList ?? searchUsersList,
            usersLoadingStatus: newUsersLoadingStatus ?? usersLoadingStatus,
            userRoleStatus: newUserRoleStatus ?? userRoleStatus,
            searchText: newSearchText ?? searchText,
            error: newError ?? error
            );
  }

  @override
  List<Object?> get props => [usersList,searchUsersList,usersLoadingStatus,userRoleStatus,searchText,error];
}
