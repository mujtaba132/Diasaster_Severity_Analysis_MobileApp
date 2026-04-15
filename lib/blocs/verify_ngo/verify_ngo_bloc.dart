import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fyp_project/Model/NGOModel/ngo_model.dart';
import 'package:fyp_project/repository/firebaseRepository/firebase_repository.dart';
import 'package:fyp_project/utils/enums.dart';

part 'verify_ngo_event.dart';
part 'verify_ngo_state.dart';

class VerifyNgoBloc extends Bloc<VerifyNgoEvent, VerifyNgoState> {
  late FirebaseRepository firebaseRepository;
  VerifyNgoBloc(this.firebaseRepository) : super(VerifyNgoState()) {
    on<OnLoadVerifiedNGOsEvent>(_onLoadVerifiedNGOs);
    on<OnSearchVerifiedNGOsEvent>(_onsearchVerifiedNgos);
  }



   void _onLoadVerifiedNGOs(
    OnLoadVerifiedNGOsEvent event,
    Emitter<VerifyNgoState> emit,
  ) async {

    emit(
      state.copyWith(newLoadVerifiedNGOsStatus: LoadVerifiedNGOsStatus.loading),
    );

    await emit.forEach<List<QueryDocumentSnapshot>>(
      firebaseRepository.listenToData(path: "NGOsRequests"),
      onData: (docs) {
        
        final ngos = docs.map((doc) => 
          NGOModel.fromFirebase(Map<String,dynamic>.from(doc.data() as Map),doc.id)).toList();

        final verified = ngos.where((ngo) => ngo.isVerified == true).toList();

        final filtered = verified.where((ngo) {
         return ngo.ngoName!.trim().toLowerCase().contains(state.searchText.toLowerCase());
        }).toList();
        return state.copyWith(
          newSearchNgos: filtered,
          newVerifiedNgo: verified,
          newSearchText: state.searchText,
          newLoadVerifiedNGOsStatus: LoadVerifiedNGOsStatus.success
          );},
      onError: (error, stackTrace) {
        return state.copyWith(newError: error.toString() ,newLoadVerifiedNGOsStatus: LoadVerifiedNGOsStatus.error);
      },
    );
  }


    void _onsearchVerifiedNgos(OnSearchVerifiedNGOsEvent event,Emitter<VerifyNgoState> emit)
  {
          final query = event.searchText.toLowerCase();

          final filtered = state.verifiedNgos.where((ngo) {
                    return ngo.ngoName!.toLowerCase().contains(query);}).toList();
        emit(state.copyWith(newSearchNgos: filtered,newSearchText: query));
  }

}
