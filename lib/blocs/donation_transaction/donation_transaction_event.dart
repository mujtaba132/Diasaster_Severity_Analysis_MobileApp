part of 'donation_transaction_bloc.dart';


abstract class DonationTransactionEvent extends Equatable {
  const DonationTransactionEvent();
  
  @override
  List<Object?> get props => [];
}

class OnLoadTransactionHistory extends DonationTransactionEvent{
    final String userId;

   const OnLoadTransactionHistory({required this.userId});
}

class OnExpandTileEvent extends DonationTransactionEvent{
    final String transactionId;

    const OnExpandTileEvent({required this.transactionId});
}

class OnChangeBankFilterEvent extends DonationTransactionEvent{
    
    final String bankName;

    const OnChangeBankFilterEvent({required this.bankName});
}

class OnChangeDateFilterEvent extends DonationTransactionEvent{
    
    final DateTime? date;

    const OnChangeDateFilterEvent({required this.date});
}


