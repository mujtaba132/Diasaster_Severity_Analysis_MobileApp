import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/repository/firebaseRepository/firebase_repository.dart';
import 'package:fyp_project/utils/enums.dart';

part 'citizen_feed_event.dart';
part 'citizen_feed_state.dart';


class CitizenFeedBloc extends Bloc<CitizenFeedEvent, CitizenFeedState> {

  FirebaseRepository firebaseRepository;
  CitizenFeedBloc(this.firebaseRepository) : super(CitizenFeedState()) {
    on<OnCitizenFeedLoadEvent>(_onCitizenFeedLoad);
  }


  void _onCitizenFeedLoad(OnCitizenFeedLoadEvent event,Emitter<CitizenFeedState> emit) async{
          emit(state.copyWith(newcitizenFeedStatus: CitizenFeedstatus.loading));

          await emit.forEach<List<QueryDocumentSnapshot>>(
          firebaseRepository.searchDocFromCollection(path: "UsersMedia",key: "post_status",query: "approved"), 
          onData: (docs) {

              final citizenFeed =  docs.map((doc) {
                   return MediaModel.fromJson(Map<String,dynamic>.from(doc.data() as Map)); 
                }).toList();

               final citizenFeedMap = {
                        for(var item in citizenFeed) item.reportId! : item             
              };

              return state.copyWith(newCitizenFeedList: citizenFeed,newCitizenFeedMap: citizenFeedMap,newcitizenFeedStatus: CitizenFeedstatus.success);
          }).onError((error, stackTrace) {
                emit(state.copyWith(newError: error.toString(), newcitizenFeedStatus: CitizenFeedstatus.error)); 
          });
  }



}
