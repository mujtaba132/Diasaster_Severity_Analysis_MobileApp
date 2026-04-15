import 'package:equatable/equatable.dart';

sealed class SignupEvent extends Equatable{
  
 const SignupEvent();
  
  @override
  List<Object?> get props => [];
}


class OnChangedEmailEvent extends SignupEvent{
      final String email;

      const OnChangedEmailEvent({required this.email});

      @override
        List<Object?> get props => [email];
}


class OnChangedPasswordEvent extends SignupEvent{
      final String password;

      const OnChangedPasswordEvent({required this.password});

      @override
        List<Object?> get props => [password];
}

class OnChangedConfirmPasswordEvent extends SignupEvent{
      final String confirmPassword;

      const OnChangedConfirmPasswordEvent({required this.confirmPassword});

      @override
        List<Object?> get props => [confirmPassword];
}


class OnPasswordVisiblityEvent extends SignupEvent{}

class OnConfirmPasswordVisiblityEvent extends SignupEvent{}

class OnFormSubmit extends SignupEvent{}