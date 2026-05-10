import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fyp_project/Model/donationModel/donation_model.dart';
import 'package:fyp_project/repository/firebaseRepository/firebase_repository.dart';
import 'package:fyp_project/utils/enums.dart';

part 'donation_transaction_event.dart';
part 'donation_transaction_state.dart';

class DonationTransactionBloc
    extends Bloc<DonationTransactionEvent, DonationTransactionState> {
  final FirebaseRepository firebaseRepository;
  DonationTransactionBloc(this.firebaseRepository)
    : super(DonationTransactionState()) {
    on<OnLoadTransactionHistory>(_onLoadDonationHistory);
    on<OnExpandTileEvent>(_onExpandTile);
    on<OnChangeBankFilterEvent>(_onChangeBankFilter);
    on<OnChangeDateFilterEvent>(_onChangeDateFilter);
  }

  void _onLoadDonationHistory(
    OnLoadTransactionHistory event,
    Emitter<DonationTransactionState> emit,
  ) async {
    emit(
      state.copyWith(
        error: '',
        donationTransactionStatus: DonationTransactionStatus.loading,
      ),
    );

    await emit.forEach(
      firebaseRepository.searchDocFromCollection(path: 'Donation',key: 'userId',query: event.userId,orderBy: 'timeStamp',),
      onData: (docs) {

        double totalAmount = 0.0;
        List<String> bankNames = ['All'];
        String? userName;
        String? userProfile;

        List<DonationModel> donationHistory = docs.map((doc) {
          final model = DonationModel.fromJson(
            Map<String, dynamic>.from(doc.data() as Map<String, dynamic>),
          );
          totalAmount += model.amount ?? 0.0;

          if (!bankNames.contains(model.bankName)) {
            bankNames.add(model.bankName!);
          }

          userName = model.userEmail!;
          userProfile = model.userProfile!;

          return model;
        }).toList();

        return state.copyWith(
          donationTransactions: donationHistory,
          searchedTransactions: donationHistory,
          donationTransactionStatus: DonationTransactionStatus.success,
          totalAmount: totalAmount,
          bankNames: bankNames,
          userName: userName,
          userProfile: userProfile,
        );
      },
      onError: (error, stackTrace) {
        return state.copyWith(
          error: error.toString(),
          donationTransactionStatus: DonationTransactionStatus.error,
        );
      },
    );
  }

  void _onExpandTile(
    OnExpandTileEvent event,
    Emitter<DonationTransactionState> emit,
  ) async {
    emit(state.copyWith(error: ''));

    List<DonationModel> updatedList = state.searchedTransactions.map((
      transaction,
    ) {
      if (transaction.donationId == event.transactionId) {
        return transaction.copyWith(isExpanded: !transaction.isExpanded!);
      }
      return transaction;
    }).toList();

    List<DonationModel> searchedList = [];

    searchedList = updatedList.where((transaction) {
      bool bankMatch = state.selectedBank == 'All'
          ? true
          : transaction.bankName == state.selectedBank;

      bool dateMatch = state.selectedDate == null
          ? true
          : isSameDate(transaction.timeStamp!, state.selectedDate!);

      return bankMatch && dateMatch;
    }).toList();

    emit(state.copyWith(searchedTransactions: searchedList));
  }

  void _onChangeBankFilter(
    OnChangeBankFilterEvent event,
    Emitter<DonationTransactionState> emit,
  ) {
    emit(
      state.copyWith(
        error: '',
        donationTransactionStatus: DonationTransactionStatus.loading,
      ),
    );

    List<DonationModel> updatedList = [];

    updatedList = state.donationTransactions.where((transaction) {
      bool bankMatch = event.bankName == 'All'
          ? true
          : transaction.bankName == event.bankName;

      bool dateMatch = state.selectedDate == null
          ? true
          : isSameDate(transaction.timeStamp!, state.selectedDate!);

      return bankMatch && dateMatch;
    }).toList();

    emit(
      state.copyWith(
        searchedTransactions: updatedList,
        donationTransactionStatus: DonationTransactionStatus.success,
        selectedBank: event.bankName,
      ),
    );
  }

  void _onChangeDateFilter(
    OnChangeDateFilterEvent event,
    Emitter<DonationTransactionState> emit,
  ) {
    emit(
      state.copyWith(
        error: '',
        donationTransactionStatus: DonationTransactionStatus.loading,
      ),
    );

    List<DonationModel> updatedList = [];

    updatedList = state.donationTransactions.where((transaction) {
      bool bankMatch = state.selectedBank == 'All'
          ? true
          : transaction.bankName == state.selectedBank;

      bool dateMatch = event.date == null
          ? true
          : isSameDate(transaction.timeStamp!, event.date!);

      return bankMatch && dateMatch;
    }).toList();

    emit(
      state.copyWith(
        searchedTransactions: updatedList,
        donationTransactionStatus: DonationTransactionStatus.success,
        selectedDate: event.date,
      ),
    );
  }

  bool isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
