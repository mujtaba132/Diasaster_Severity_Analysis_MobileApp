import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fyp_project/Model/NGOModel/ngo_model.dart';
import 'package:fyp_project/repository/current_user_repository/current_user_repository.dart';
import 'package:fyp_project/repository/firebaseRepository/firebase_repository.dart';
import 'package:fyp_project/utils/enums.dart';

part 'donation_event.dart';
part 'donation_state.dart';

class DonationBloc extends Bloc<DonationEvent, DonationState> {
  final FirebaseRepository firebaseRepository;
  final CurrentUserRepository currentUserRepository;
  DonationBloc(this.firebaseRepository, this.currentUserRepository)
    : super(DonationState()) {
    on<OnLoadDonationNGOsEvent>(_onLoadDonationNgos);
    on<OnUpdateIndexEvent>(_onUpdateIndex);
    on<OnChangeDonationAmountEvent>(_onChangeAmount);
  }

  void _onLoadDonationNgos(
    OnLoadDonationNGOsEvent event,
    Emitter<DonationState> emit,
  ) async {
    emit(
      state.copyWith(
        error: '',
        verifiedNGOsDonationStatus: VerifiedNGOsDonationStatus.loading,
      ),
    );

    await emit.forEach<List<QueryDocumentSnapshot>?>(
      firebaseRepository.multiSearchDocFromCollection(
        path: 'NGOsRequests',
        key: 'isVerified',
        query: true,
        key2: 'userId',
        query2: currentUserRepository.userId()!,
      ),
      onData: (docs) {
        final ngos = docs!
            .map(
              (doc) => NGOModel.fromFirebase(
                Map<String, dynamic>.from(doc.data() as Map),
                doc.id,
              ),
            )
            .toList();

        final maps = {for (var ngo in ngos) ngo.id: ngo};

        String selectedId;

        if (ngos.isNotEmpty) {
          selectedId = ngos.first.id!;
        } else {
          selectedId = "card";
        }

        return state.copyWith(
          donationMap: maps,
          donationNGOs: ngos,
          selectedNgoId: selectedId,
          verifiedNGOsDonationStatus: VerifiedNGOsDonationStatus.success,
        );
      },
      onError: (error, stackTrace) {
        return state.copyWith(
          error: error.toString(),
          verifiedNGOsDonationStatus: VerifiedNGOsDonationStatus.error,
        );
      },
    );
  }

  void _onUpdateIndex(OnUpdateIndexEvent event, Emitter<DonationState> emit) {
    final updatedMap = Map<String, NGOModel>.from(state.donationMap);

    updatedMap.updateAll((key, value) {
      return value.copyWith(isSelected: false);
    });

    if (event.ngoId != "card") {
      updatedMap[event.ngoId] = updatedMap[event.ngoId]!.copyWith(
        isSelected: true,
      );
    }

    emit(state.copyWith(donationMap: updatedMap, selectedNgoId: event.ngoId));
  }


  void _onChangeAmount(OnChangeDonationAmountEvent event,Emitter<DonationState> emit){
      
      double? amount = double.tryParse(event.amount);
      emit(state.copyWith(donatedAmount: amount));
  }

}
