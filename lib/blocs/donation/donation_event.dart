part of 'donation_bloc.dart';


sealed class DonationEvent extends Equatable{

  const DonationEvent();
  
  @override
  List<Object?> get props => [];
}

class OnLoadDonationNGOsEvent extends DonationEvent{
    final String userId;

    const OnLoadDonationNGOsEvent({required this.userId});
}

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

class OnDonateAmountEvent extends DonationEvent{}

class OnCardPaymentEvent extends DonationEvent{
    final String amount;
    final String currency;

    const OnCardPaymentEvent({required this.amount,required this.currency});
    
     @override
     List<Object?> get props => [amount,currency];
}

