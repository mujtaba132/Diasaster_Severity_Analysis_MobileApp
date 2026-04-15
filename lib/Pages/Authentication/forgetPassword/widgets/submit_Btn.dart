import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/forgetpassword/forget_password_bloc.dart';
import 'package:fyp_project/config/Components/CustomSnackbar.dart';
import 'package:fyp_project/config/components/Custom_Btns.dart';
import 'package:fyp_project/utils/enums.dart';

class ForgetsubmitBtn extends StatelessWidget {
  final GlobalKey<FormState> formkey;
  const ForgetsubmitBtn({super.key, required this.formkey});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
      listenWhen:  (previous, current) => previous.sendLinkStatus != current.sendLinkStatus,
      listener: (context, state) {
             if(state.sendLinkStatus==SendLinkStatus.error)
             {
                CustomSnackBar.error(state.error);
             }
             else if(state.sendLinkStatus == SendLinkStatus.success)
             {
                CustomSnackBar.success('Email Successfully send to ${state.email}');
             }
      },
      child: BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
        buildWhen: (previous, current) =>
            previous.timerStatus != current.timerStatus ||
            previous.remainingSeconds != current.remainingSeconds ||
            previous.sendLinkStatus != current.sendLinkStatus,
        builder: (context, state) {
          print(state.timerStatus);
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Theme_Button(
              text: state.timerStatus == TimerStatus.visible
                  ? "Resend in ${state.remainingSeconds}s"
                  : "Send Reset Link",
              textColor: Colors.white,
              height: 55,
              width: double.infinity,
              bgColor: theme.colorScheme.primary,
              isLoading: state.sendLinkStatus == SendLinkStatus.loading
                  ? true
                  : false,
              onclick: () {
                if (formkey.currentState!.validate()) {
                  state.timerStatus == TimerStatus.visible
                      ? null
                      : context.read<ForgetPasswordBloc>().add(
                          OnFormSubmitEvent(),
                        );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
