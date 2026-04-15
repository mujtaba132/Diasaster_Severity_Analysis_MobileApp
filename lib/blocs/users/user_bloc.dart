import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fyp_project/Model/userModel/user_model.dart';
import 'package:fyp_project/repository/firebaseRepository/firebase_repository.dart';
import 'package:fyp_project/utils/enums.dart';
part 'user_event.dart';
part 'user_state.dart';


class UserBloc extends Bloc<UserEvent, UserState> {

  FirebaseRepository firebaseRepository;
  UserBloc(this.firebaseRepository) : super(UserState()) {
    on<OnLoadUserEvent>(_onLoadUser);
    on<OnChangeUserRoleEvent>(_onChangeUserRole);
    on<OnSearchUserEvent>(_onSearchUser);
  }


  void _onLoadUser(OnLoadUserEvent event,Emitter<UserState> emit)
  async{
        emit(state.copyWith(newUsersLoadingStatus: UsersLoadingStatus.loading));

        await emit.forEach<List<QueryDocumentSnapshot>>(
           firebaseRepository.listenToData(path: 'Users'), 
           onData: (docs) { 
                 final users = docs.map((doc) => 
                 UserModel.fromFirebase(Map<String,dynamic>.from(doc.data() as Map),doc.id)).toList();

                 String query = state.searchText.toLowerCase().trim();
                 List<UserModel> newSearchedList = users.where((user) => user.email!.contains(query)).toList();
           
                 return state.copyWith(newUserList: users,newSearchUserList: newSearchedList,newUsersLoadingStatus: UsersLoadingStatus.success);
            },
          onError:(error, stackTrace){
              return state.copyWith(newUsersLoadingStatus: UsersLoadingStatus.error,newError: error.toString());
           });
    }

  
  void _onChangeUserRole(OnChangeUserRoleEvent event,Emitter<UserState> emit)
  async{
         
          List<UserModel> updatedList = state.usersList.map((user) {
                 if(user.id==event.userId)
                 {
                    return user.copyWith(userRole: event.userRole);
                 }
                 return user;
          }).toList();
           
          
          String query = state.searchText.toLowerCase().trim();
          List<UserModel> newSearchedList = updatedList.where((user) => user.email!.contains(query)).toList();          
          emit(state.copyWith(newSearchUserList: newSearchedList,newUserList: updatedList));

          await firebaseRepository.updateData(path: "Users/${event.userId}", data: {'role': event.userRole.name }).then((value) {
              emit(state.copyWith(newUserRoleStatus: UserRoleStatus.success));
          }).onError((error, stackTrace) {
              emit(state.copyWith(newUserRoleStatus: UserRoleStatus.error,newError: error.toString()));   
          });
                
  }


  void _onSearchUser(OnSearchUserEvent event,Emitter<UserState> emit)
  {
        String query = event.searchText.toLowerCase().trim();
        List<UserModel> updatedList = state.usersList.where((user) => user.email!.contains(query)).toList();
        emit(state.copyWith(newSearchUserList: updatedList,newSearchText: event.searchText));
  }
}
