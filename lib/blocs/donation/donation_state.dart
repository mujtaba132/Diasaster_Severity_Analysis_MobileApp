part of 'donation_bloc.dart';


class DonationState extends Equatable  {

  final VerifiedNGOsDonationStatus verifiedNGOsDonationStatus;
  final DonationStatus donationStatus;
  final List<NGOModel> donationNGOs;
  final Map<String?,dynamic> donationMap;
  final String selectedNgoId;
  final double donatedAmount;
  final String error;

  const DonationState({
    this.verifiedNGOsDonationStatus = VerifiedNGOsDonationStatus.initail, 
    this.donationStatus = DonationStatus.initail,
    this.donationNGOs = const [],
    this.donationMap = const {},
    this.selectedNgoId = '',
    this.donatedAmount = 0.0,
    this.error = ''
    });

  
  DonationState copyWith ({
      VerifiedNGOsDonationStatus? verifiedNGOsDonationStatus,
      DonationStatus? donationStatus,
      List<NGOModel>? donationNGOs,
      Map<String?,dynamic>? donationMap,
      String? selectedNgoId,
      double? donatedAmount,
      String? error,
  }){
      return DonationState(
        verifiedNGOsDonationStatus: verifiedNGOsDonationStatus ?? this.verifiedNGOsDonationStatus,
        donationStatus: donationStatus ?? this.donationStatus,
        donationNGOs:  donationNGOs ?? this.donationNGOs,
        donationMap:  donationMap ?? this.donationMap,
        selectedNgoId: selectedNgoId ?? this.selectedNgoId,
        donatedAmount: donatedAmount ?? this.donatedAmount,
        error: error ?? this.error,
      );
  }
    
      @override
      List<Object?> get props => [
        verifiedNGOsDonationStatus,
        donationStatus,
        donationNGOs,
        donationMap,
        selectedNgoId,
        donatedAmount,
        error
      ];
}
