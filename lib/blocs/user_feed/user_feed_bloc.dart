import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/repository/firebaseRepository/firebase_repository.dart';
import 'package:fyp_project/utils/enums.dart';

part 'user_feed_event.dart';
part 'user_feed_state.dart';


class UserFeedBloc extends Bloc<UserFeedEvent, UserFeedState> {

  FirebaseRepository firebaseRepository;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  UserFeedBloc(this.firebaseRepository) : super(UserFeedState()) {
    on<OnUserFeedLoadEvent>(_onUserFeedLoad);
    on<OnSearchUserFeedEvent>(_onSearchUserFeed);
  }

   void _onUserFeedLoad(OnUserFeedLoadEvent event,Emitter<UserFeedState> emit) async{
          emit(state.copyWith(newUserFeedStatus: UserFeedstatus.loading));

          if(_firebaseAuth.currentUser==null)
          {
             emit(state.copyWith(newError: 'No User Found', newUserFeedStatus: UserFeedstatus.error));
             return; 
          }

          await emit.forEach<List<QueryDocumentSnapshot>>(
          firebaseRepository.searchDocFromCollection(path: "UsersMedia",key: "user_token",query: _firebaseAuth.currentUser!.uid), 
          onData: (docs) {

              final userFeed =  docs.map((doc) {
                   return MediaModel.fromJson(Map<String,dynamic>.from(doc.data() as Map)); 
                }).toList();
              
              final userFeedMap = {
                        for(var item in userFeed) item.reportId! : item             
              };

              return state.copyWith(newuserFeedList: userFeed,newSearchFeedList: userFeed,newUserFeedMap: userFeedMap,newUserFeedStatus: UserFeedstatus.success);
          }).onError((error, stackTrace) {
                emit(state.copyWith(newError: error.toString(), newUserFeedStatus: UserFeedstatus.error)); 
          });
  }



  void _onSearchUserFeed(OnSearchUserFeedEvent event, Emitter<UserFeedState> emit){
         
         String query = event.query.toLowerCase();

         List<MediaModel> searchedList = state.userFeed.where((report) =>
                                          report.disasterType!.toLowerCase().contains(query))
                                          .toList();


        emit(state.copyWith(newSearchFeedList: searchedList,newSearchQuery: query));      
  }
}
