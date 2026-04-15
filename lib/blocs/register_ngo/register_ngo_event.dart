part of 'register_ngo_bloc.dart';


abstract class RegisterNgoEvent extends Equatable {
  const RegisterNgoEvent();

  @override
  List<Object?> get props => [];
}

class OnChangedNameEvent extends RegisterNgoEvent{
      final String name;

      const OnChangedNameEvent({required this.name});

      @override
        List<Object?> get props => [name];
}

class OnChangedAddressEvent extends RegisterNgoEvent{
      final String address;

      const OnChangedAddressEvent({required this.address});

      @override
        List<Object?> get props => [address];
}

class OnChangedPhoneNoEvent extends RegisterNgoEvent{
      final String phoneNo;

      const OnChangedPhoneNoEvent({required this.phoneNo});

      @override
        List<Object?> get props => [phoneNo];
}

class OnChangedBankNameEvent extends RegisterNgoEvent{
      final String bankName;

      const OnChangedBankNameEvent({required this.bankName});

      @override
      List<Object?> get props => [bankName];
}

class OnChangedAccountNoEvent extends RegisterNgoEvent{
      final String accountNo;

      const OnChangedAccountNoEvent({required this.accountNo});

      @override
      List<Object?> get props => [accountNo];
}

class OnPickFileEvent extends RegisterNgoEvent{}

class OnUploadFileEvent extends RegisterNgoEvent{}

class OnregisterFormSubmitEvent extends RegisterNgoEvent{}

