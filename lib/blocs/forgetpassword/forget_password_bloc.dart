import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fyp_project/repository/auth_repository/forgetPasswordRepository.dart';
import 'package:fyp_project/utils/enums.dart';
part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  Timer? _timer;
  final Forgetpasswordrepository forgetpasswordrepository;
  ForgetPasswordBloc(this.forgetpasswordrepository)
    : super(ForgetPasswordState()) {
    on<OnChangeEmailEvent>(_onChangeEmail);
    on<OnFormSubmitEvent>(_onSubmitForm);
    on<TimerTickEvent>(_timerTickEvent);
  }

  void _onChangeEmail(
    OnChangeEmailEvent event,
    Emitter<ForgetPasswordState> emit,
  ) {
    emit(state.copyWith(newEmail: event.email));
  }

  void _onSubmitForm(
    OnFormSubmitEvent event,
    Emitter<ForgetPasswordState> emit,
  ) async {
    emit(state.copyWith(newSendLinkStatus: SendLinkStatus.loading));

    await forgetpasswordrepository.sendPasswordResetEmail(email: state.email)
        .then((value) {
          emit(state.copyWith(newSendLinkStatus: SendLinkStatus.success,
          newTimerStatus: TimerStatus.visible,
          newRemainingSeconds: 30));
          _startTimer();
        })
        .onError((error, stackTrace) {
          emit(state.copyWith(newSendLinkStatus: SendLinkStatus.error,newError: error.toString()));
        });
  }

  void _startTimer() {
         
         _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
             add(TimerTickEvent());
         });
  }

  void _timerTickEvent(TimerTickEvent event,Emitter<ForgetPasswordState> emit)
  {
       if (state.remainingSeconds > 1) {
        emit(state.copyWith(newRemainingSeconds: state.remainingSeconds-1));
      } else {
        emit(state.copyWith(newTimerStatus: TimerStatus.nonvisible));
        _timer?.cancel();
      }
  }
}
