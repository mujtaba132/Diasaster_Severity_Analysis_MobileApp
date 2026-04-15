part of 'forget_password_bloc.dart';


class ForgetPasswordState  extends Equatable{

   final String email;
   final String error;
   final SendLinkStatus sendLinkStatus;
   final int remainingSeconds;
   final TimerStatus timerStatus; 

  const ForgetPasswordState({
        this.email='',
        this.error='',
        this.sendLinkStatus=SendLinkStatus.initail,
        this.remainingSeconds=30,
        this.timerStatus= TimerStatus.nonvisible
        });
  
  ForgetPasswordState copyWith
  ({
     String? newEmail,
     String? newError,
     SendLinkStatus? newSendLinkStatus,
     int? newRemainingSeconds,
     TimerStatus? newTimerStatus,
  })
  {
    return ForgetPasswordState(
      email: newEmail ?? email,
      error: newError ?? error,
      sendLinkStatus: newSendLinkStatus ?? sendLinkStatus, 
      remainingSeconds: newRemainingSeconds ?? remainingSeconds,
      timerStatus: newTimerStatus ?? timerStatus,
     );
  }

  @override
  List<Object?> get props => [email,error,sendLinkStatus,remainingSeconds,timerStatus];
}
