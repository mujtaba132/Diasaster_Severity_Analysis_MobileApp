part of 'forget_password_bloc.dart';


sealed class ForgetPasswordEvent extends Equatable {

  const ForgetPasswordEvent();
  
  @override
  List<Object?> get props => [];
}


class OnChangeEmailEvent extends ForgetPasswordEvent {
    final String email;
    
    const OnChangeEmailEvent({required this.email});
    
  @override
  List<Object?> get props => [email];
}
 
class TimerTickEvent extends ForgetPasswordEvent{}

class OnFormSubmitEvent extends ForgetPasswordEvent {}