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

              return state.copyWith(newAdminFeedList: adminFeed,newAdminFeedMap: adminFeedMap,newAdminFeedStatus: AdminFeedstatus.success);
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


           emit(state.copyWith(newAdminFeedList: updatedList));

           await  firebaseRepository.updateData(path: "UsersMedia/${event.reportId}", data: {"post_status": event.newStatus.name})
           .then((value) {
               emit(state.copyWith(newAdminPostStatus: AdminPoststatus.success));
           })
           .onError((error, stackTrace) {
                emit(state.copyWith(newError: error.toString(),newAdminPostStatus: AdminPoststatus.error));
           });
  }
}

