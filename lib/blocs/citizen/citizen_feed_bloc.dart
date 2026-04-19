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
    on<OnChangeFeedFilterEvent>(_onChangeFeedFilter);
    on<OnSearchFeedEvent>(_onSearchFeed);
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

              return state.copyWith(newCitizenFeedList: citizenFeed,newSearchedFeedList: citizenFeed ,newCitizenFeedMap: citizenFeedMap,newcitizenFeedStatus: CitizenFeedstatus.success);
          }).onError((error, stackTrace) {
                emit(state.copyWith(newError: error.toString(), newcitizenFeedStatus: CitizenFeedstatus.error)); 
          });
  }

  void _onChangeFeedFilter(OnChangeFeedFilterEvent event,Emitter<CitizenFeedState> emit){
                  
                  final changeFilterState = state.copyWith(newCitizenFeedFilter: event.citizenFeedFilter);

                  List<MediaModel> updatedList =  _searchandFilterFeed(changeFilterState);

                  emit(state.copyWith(newSearchedFeedList: updatedList,newCitizenFeedFilter: event.citizenFeedFilter));
  }


  void _onSearchFeed(OnSearchFeedEvent event,Emitter<CitizenFeedState> emit){
          
          final changeSearchState = state.copyWith(newSearchQuery: event.query);

          List<MediaModel> updatedFeed = _searchandFilterFeed(changeSearchState);

          emit(state.copyWith(newSearchedFeedList: updatedFeed,newSearchQuery: event.query));
  }


  List<MediaModel> _searchandFilterFeed(CitizenFeedState state){ 
            
            return state.citizenFeed.where((report) {
                  
                  bool isSearchMatch = state.searchQuery.isEmpty ||
                                      report.disasterType!.toLowerCase().
                                      contains(state.searchQuery);

                 bool isFilteredMatch;

                   switch (state.citizenFeedFilter) {
                   case CitizenFeedFilters.all:
                     isFilteredMatch = true;
                     break;
                    case CitizenFeedFilters.severe:
                     isFilteredMatch =  report.severity! >= 70.0;
                     break;
                    case CitizenFeedFilters.mild:
                     isFilteredMatch = report.severity! >= 40.0 && report.severity! < 70.0;
                     break;  
                    case CitizenFeedFilters.nodamage:
                     isFilteredMatch = report.severity! < 40.0;
                     break;
                 }

                 return isFilteredMatch && isSearchMatch;
            }).toList();
  }

}
