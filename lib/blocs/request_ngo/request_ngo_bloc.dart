import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fyp_project/Model/NGOModel/ngo_model.dart';
import 'package:fyp_project/repository/firebaseRepository/firebase_repository.dart';
import 'package:fyp_project/utils/enums.dart';

part 'request_ngo_event.dart';
part 'request_ngo_state.dart';


class RequestNgoBloc extends Bloc<RequestNgoEvent, RequestNgoState> {

  late FirebaseRepository firebaseRepository;
  RequestNgoBloc(this.firebaseRepository) : super(RequestNgoState()) {
    on<OnLoadNGORequestsEvent>(_onLoadNGOsRequests);
    on<OnChnageNGOFilterEvent>(_onChnageNgosFilter);
    on<OnVerifyNGOEvent>(_onVerifyNGO);
    on<OnSearchNGOsRequestEvent>(_onSearchNGO);
  }

   void _onLoadNGOsRequests(
    OnLoadNGORequestsEvent event,
    Emitter<RequestNgoState> emit,
  ) async {

    emit(
      state.copyWith(newLoadNGOsRequestStatus: LoadNGOsRequestStatus.loading),
    );

    await emit.forEach<List<QueryDocumentSnapshot>>(
      firebaseRepository.listenToData(path: "NGOsRequests"),
      onData: (docs) {
          final ngos = docs.map((doc) => 
            NGOModel.fromFirebase(Map<String,dynamic>.from(doc.data() as Map),doc.id)
          ).toList();
        return state.copyWith(newNgoRequest: ngos,newfilteredRequests: ngos,newLoadNGOsRequestStatus: LoadNGOsRequestStatus.success);
      },
      onError: (error, stackTrace) {
        return state.copyWith(newError: error.toString(),newLoadNGOsRequestStatus: LoadNGOsRequestStatus.error);
      },
    );
  }


  void _onChnageNgosFilter(
    OnChnageNGOFilterEvent event,
    Emitter<RequestNgoState> emit,
  )
  {
     emit(state.copyWith(newNgoFilterType: event.ngosFilterType));

    add(OnSearchNGOsRequestEvent(searchText: state.searchText));
  }

   void _onVerifyNGO(
    OnVerifyNGOEvent event,
    Emitter<RequestNgoState> emit,
  ) async {

  final updatedList = state.ngoRequests.map((ngo) {
    if (ngo.id == event.id) {
      return ngo.copyWith(isVerified: !ngo.isVerified!);
    }
    return ngo;
  }).toList();

  emit(state.copyWith(
    newNgoRequest: updatedList,
    newfilteredRequests: updatedList,
    newVerifyNGOStatus: VerifyNGOsStatus.loading,
  ));

  try {
    await firebaseRepository.updateData(path: 'NGOsRequests/${event.id}',data: {'isVerified':!event.isVerified});

    emit(state.copyWith( newVerifyNGOStatus: VerifyNGOsStatus.success));

  } catch (e) {
    emit(state.copyWith( newVerifyNGOStatus: VerifyNGOsStatus.error,newError: e.toString()));
  }
  }

   
  void _onSearchNGO(OnSearchNGOsRequestEvent event,Emitter<RequestNgoState> emit)
  {
    
     final String query = event.searchText.toLowerCase();
     final List<NGOModel> filteredRequests;

     switch (state.ngosFilterType) {
       case NGOsFilterType.all:
          filteredRequests = state.ngoRequests;
          break;
       case NGOsFilterType.verified:
           filteredRequests =  state.ngoRequests.where((ngo) => ngo.isVerified == true).toList();
           break;
        case NGOsFilterType.unverified:
           filteredRequests =  state.ngoRequests.where((ngo) => ngo.isVerified == false).toList();
           break;
     }

       List<NGOModel> searchedRequests = 
       filteredRequests.where((ngo) => ngo.ngoName!.toLowerCase().contains(query)).toList();

       emit(state.copyWith(
            newSearchText: event.searchText,
            newfilteredRequests: searchedRequests,
       ));
  }

}
