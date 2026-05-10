import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fyp_project/Model/NGOModel/ngo_model.dart';
import 'package:fyp_project/Model/donationModel/donation_model.dart';
import 'package:fyp_project/repository/current_user_repository/current_user_repository.dart';
import 'package:fyp_project/repository/firebaseRepository/firebase_repository.dart';
import 'package:fyp_project/repository/payment_repository/stripe_payment_repository.dart';
import 'package:fyp_project/utils/enums.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

part 'donation_event.dart';
part 'donation_state.dart';

class DonationBloc extends Bloc<DonationEvent, DonationState> {
  final FirebaseRepository firebaseRepository;
  final CurrentUserRepository currentUserRepository;
  final StripePaymentRepository stripePaymentRepository;
  DonationBloc(
    this.firebaseRepository,
    this.currentUserRepository,
    this.stripePaymentRepository,
  ) : super(DonationState()) {
    on<OnLoadDonationNGOsEvent>(_onLoadDonationNgos);
    on<OnUpdateIndexEvent>(_onUpdateIndex);
    on<OnChangeDonationAmountEvent>(_onChangeAmount);
    on<OnDonateAmountEvent>(_onDonateAmount);
    on<OnCardPaymentEvent>(_onCardPayment);
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
        query2: event.userId,
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
    emit(state.copyWith(error: ''));

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

  void _onChangeAmount(
    OnChangeDonationAmountEvent event,
    Emitter<DonationState> emit,
  ) {
    emit(state.copyWith(error: ''));
    double? amount = double.tryParse(event.amount);
    emit(state.copyWith(donatedAmount: amount));
  }

  void _onDonateAmount(
    OnDonateAmountEvent event,
    Emitter<DonationState> emit,
  ) async {
    NGOModel ngo;
    if (state.donatedAmount <= 0.0) {
      emit(
        state.copyWith(
          error: 'Please enter valid amount to donate...',
          donationStatus: DonationStatus.error,
        ),
      );
      return;
    }

    if (state.donatedAmount >= 1000000.0) {
      emit(
        state.copyWith(
          error: 'Amount must be less then 1 Million',
          donationStatus: DonationStatus.error,
        ),
      );
      return;
    }

    emit(state.copyWith(error: '', donationStatus: DonationStatus.loading));

    ngo = state.donationNGOs
        .where((element) => element.id == state.selectedNgoId)
        .first;

    DonationModel model = DonationModel(
      donationId: Uuid().v4(),
      userId: currentUserRepository.userId(),
      userEmail: currentUserRepository.userEmail(),
      userProfile: currentUserRepository.userProfileUrl(),
      amount: state.donatedAmount,
      ngoName: ngo.ngoName,
      bankName: ngo.bankName,
      accountNo: ngo.accountNo,
      method: DonationMethod.ngo,
      timeStamp: DateTime.timestamp()
    );

    await firebaseRepository.setData(
      collectionPath: 'Donation',
      docpath: model.donationId!,
      data: model.toJson(),
    );

    emit(state.copyWith(donationStatus: DonationStatus.success));
  }

  void _onCardPayment(
    OnCardPaymentEvent event,
    Emitter<DonationState> emit,
  ) async {
    if (state.donatedAmount <= 0.0) {
      emit(
        state.copyWith(
          error: 'Please enter valid amount to donate...',
          donationStatus: DonationStatus.error,
        ),
      );
      return;
    }

    if (state.donatedAmount >= 1000000.0) {
      emit(
        state.copyWith(
          error: 'Amount must be less then 1 Million',
          donationStatus: DonationStatus.error,
        ),
      );
      return;
    }

    emit(state.copyWith(error: '', donationStatus: DonationStatus.loading));

    await stripePaymentRepository
        .makeCardPayment(amount: event.amount, currency: event.currency)
        .onError((error, stackTrace) {
          emit(
            state.copyWith(
              error: 'Payment failed',
              donationStatus: DonationStatus.error,
            ),
          );
          return;
        });

    DonationModel model = DonationModel(
      donationId: Uuid().v4(),
      userId: currentUserRepository.userId(),
      userEmail: currentUserRepository.userEmail(),
      userProfile: currentUserRepository.userProfileUrl(),
      amount: state.donatedAmount,
      bankName: 'Card Payment',
      timeStamp: DateTime.timestamp()
    );

    await firebaseRepository.setData(
      collectionPath: 'Donation',
      docpath: model.donationId!,
      data: model.toJson(),
    );

    emit(state.copyWith(donationStatus : DonationStatus.success));
  }
}
