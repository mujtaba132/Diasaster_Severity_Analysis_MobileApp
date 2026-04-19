import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/repository/firebaseRepository/firebase_repository.dart';
import 'package:fyp_project/utils/enums.dart';

part 'admin_feed_event.dart';
part 'admin_feed_state.dart';


class AdminFeedBloc extends Bloc<AdminFeedEvent, AdminFeedState> {

  FirebaseRepository firebaseRepository;
  AdminFeedBloc(this.firebaseRepository) : super(AdminFeedState()) {
    on<OnAdminFeedLoadEvent>(_onCitizenFeedLoad);
    on<OnChangePostStatusEvent>(_onChangePostStatus);
    on<OnChangeSearchFeildEvent>(_onChangeSearchFeild);
    on<OnChangePostFilterEvent>(_onChangeFeedFilter);
  }


  void _onCitizenFeedLoad(AdminFeedEvent event,Emitter<AdminFeedState> emit) async{
          emit(state.copyWith(newAdminFeedStatus: AdminFeedstatus.loading));

          await emit.forEach<List<QueryDocumentSnapshot>>(
          firebaseRepository.listenToData(path: "UsersMedia"), 
          onData: (docs) {

              final adminFeed =  docs.map((doc) {
                   return MediaModel.fromJson(Map<String,dynamic>.from(doc.data() as Map)); 
                }).toList();
              
               final adminFeedMap = {
                        for(var item in adminFeed) item.reportId! : item             
              };

              final updatedState = state.copyWith(newAdminFeedList: adminFeed);
              List<MediaModel> updateSearch = _searchandFilterFeed(updatedState);

              return state.copyWith(newAdminFeedList: adminFeed,newSearchedFeed: updateSearch,newAdminFeedMap: adminFeedMap,newAdminFeedStatus: AdminFeedstatus.success);
          }).onError((error, stackTrace) {
                emit(state.copyWith(newError: error.toString(), newAdminFeedStatus: AdminFeedstatus.error)); 
          });
  }

  

  void _onChangePostStatus(OnChangePostStatusEvent event,Emitter<AdminFeedState> emit)
  async{
           emit(state.copyWith(newAdminPostStatus: AdminPoststatus.loading));

           List<MediaModel> updatedList = state.adminFeed.map((post) {
                if(event.reportId == post.reportId)
                {
                   return post.copyWith(status: event.newStatus);
                }
                return post;
           }).toList();

           final updatedState = state.copyWith(newAdminFeedList: updatedList);
           List<MediaModel> updateSearch = _searchandFilterFeed(updatedState);
           emit(state.copyWith(newSearchedFeed: updateSearch));

           await  firebaseRepository.updateData(path: "UsersMedia/${event.reportId}", data: {"post_status": event.newStatus.name})
           .then((value) {
               emit(state.copyWith(newAdminPostStatus: AdminPoststatus.success));
           })
           .onError((error, stackTrace) {
                emit(state.copyWith(newError: error.toString(),newAdminPostStatus: AdminPoststatus.error));
           });
  }


  void _onChangeFeedFilter(OnChangePostFilterEvent event,Emitter<AdminFeedState> emit){
        
              final changeFilterState = state.copyWith(newAdminFilter: event.newFilter);

              List<MediaModel> updatedList = _searchandFilterFeed(changeFilterState);

              emit(state.copyWith(newSearchedFeed: updatedList,newAdminFilter: event.newFilter));
  }


   void _onChangeSearchFeild(OnChangeSearchFeildEvent event,Emitter<AdminFeedState> emit){
          
             final changeSearchState = state.copyWith(newSearchQuery: event.query);

              List<MediaModel> updatedList = _searchandFilterFeed(changeSearchState);

              emit(state.copyWith(newSearchedFeed: updatedList,newSearchQuery: event.query));
            
  }

  List<MediaModel> _searchandFilterFeed(AdminFeedState state){
          
            return state.adminFeed.where((report) {

                 bool isSearchMatch = state.searchQuery.isEmpty ||
                                      report.disasterType!.toLowerCase().
                                      contains(state.searchQuery.toLowerCase());

                bool isFilteredMatch;

                switch (state.adminFeedFilter) {
                  case  AdminFeedPostStatus.all:
                    isFilteredMatch = true;
                    break;
                  case  AdminFeedPostStatus.pending:
                    isFilteredMatch = report.status == CitizenFeedStatus.pending;
                    break;
                  case  AdminFeedPostStatus.processing:
                    isFilteredMatch = report.status == CitizenFeedStatus.processing;
                    break;
                  case  AdminFeedPostStatus.approved:
                    isFilteredMatch = report.status == CitizenFeedStatus.approved;
                    break;
                }

                return isSearchMatch && isFilteredMatch;
            }).toList();
  }

}

