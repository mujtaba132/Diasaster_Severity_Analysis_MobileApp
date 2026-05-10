part of 'donation_transaction_bloc.dart';

class DonationTransactionState extends Equatable {
  final double totalAmount;
  final List<DonationModel> donationTransactions;
  final DonationTransactionStatus donationTransactionStatus;
  final List<String> bankNames;
  final List<DonationModel> searchedTransactions;
  final String selectedBank;
  final DateTime? selectedDate;
  final String userName;
  final String userProfile;
  final String error;

  const DonationTransactionState({
    this.totalAmount = 0.0,
    this.donationTransactions = const [],
    this.donationTransactionStatus = DonationTransactionStatus.initail,
    this.bankNames = const [],
    this.searchedTransactions = const [],
    this.selectedBank = 'All',
    this.selectedDate,
    this.userName = '',
    this.userProfile = '',
    this.error = '',
  });

  DonationTransactionState copyWith({
    double? totalAmount,
    List<DonationModel>? donationTransactions,
    DonationTransactionStatus? donationTransactionStatus,
    List<String>? bankNames,
    List<DonationModel>? searchedTransactions,
    String? selectedBank,
    DateTime? selectedDate,
    String? userName,
    String? userProfile,
    String? error,
  }) {
    return DonationTransactionState(
      totalAmount: totalAmount ?? this.totalAmount,
      donationTransactionStatus:
          donationTransactionStatus ?? this.donationTransactionStatus,
      donationTransactions: donationTransactions ?? this.donationTransactions,
      bankNames: bankNames ?? this.bankNames,
      searchedTransactions: searchedTransactions ?? this.searchedTransactions,
      selectedBank: selectedBank ?? this.selectedBank,
      selectedDate: selectedDate ?? this.selectedDate,
      userName: userName ?? this.userName,
      userProfile: userProfile ?? this.userProfile,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
    totalAmount,
    bankNames,
    searchedTransactions,
    donationTransactionStatus,
    donationTransactions,
    error,
    userName,
    userProfile,
    selectedBank,
  ];
}
