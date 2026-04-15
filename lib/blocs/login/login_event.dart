part of 'login_bloc.dart';


sealed class LoginEvent extends Equatable {
  const LoginEvent();
  
  @override
  List<Object?> get props => [];
}


class OnChangedEmailEvent extends LoginEvent{
      final String email;

      const OnChangedEmailEvent({required this.email});

      @override
        List<Object?> get props => [email];
}


class OnChangedPasswordEvent extends LoginEvent{
      final String password;

      const OnChangedPasswordEvent({required this.password});

      @override
        List<Object?> get props => [password];
}

class OnPasswordVisiblityEvent extends LoginEvent{}

class OnFormSubmitEvent extends LoginEvent{}

class OnGoogleSignInEvent extends LoginEvent{}


