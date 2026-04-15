part of 'user_bloc.dart';


class UserEvent extends Equatable {

  const UserEvent();
  
  @override
  List<Object?> get props => [];
}



class OnLoadUserEvent extends UserEvent{}

class OnSearchUserEvent extends UserEvent{
     final String searchText;

     const OnSearchUserEvent({required this.searchText});

      @override
      List<Object?> get props => [searchText];
}

class OnChangeUserRoleEvent extends UserEvent{
  final String userId;
  final Role userRole;
  
  const OnChangeUserRoleEvent({required this.userId,required this.userRole});

  @override
  List<Object?> get props => [userId,userRole];
}