part of 'donation_bloc.dart';


sealed class DonationEvent extends Equatable{

  const DonationEvent();
  
  @override
  List<Object?> get props => [];
}

class OnLoadDonationNGOsEvent extends DonationEvent{}

class OnUpdateIndexEvent extends DonationEvent{
     final String ngoId;

     const OnUpdateIndexEvent({required this.ngoId});
   
     @override
     List<Object?> get props => [ngoId];
}

class OnChangeDonationAmountEvent extends DonationEvent{
     final String amount;

     const OnChangeDonationAmountEvent({required this.amount});
     @override
     List<Object?> get props => [amount];
}

