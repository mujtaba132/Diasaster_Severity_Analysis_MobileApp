import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/register_ngo/register_ngo_bloc.dart';
import 'package:fyp_project/config/Components/CustomSnackbar.dart';
import 'package:fyp_project/config/Components/Custom_Btns.dart';
import 'package:fyp_project/utils/enums.dart';

class SubmitButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const SubmitButton({super.key,required this.formKey});
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<RegisterNgoBloc,RegisterNgoState>(
      listenWhen: (previous, current) => previous.submitRegisterNGOsStatus!=current.submitRegisterNGOsStatus,
      listener: (context, state) {
            if(state.submitRegisterNGOsStatus==SubmitRegisterNGOsStatus.success)
            {
               CustomSnackBar.success('Registration Request Submitted Successfully');
            }
            else if(state.submitRegisterNGOsStatus==SubmitRegisterNGOsStatus.error)
            {
               CustomSnackBar.error(state.error.toString());
            }
    },
    child:
      BlocBuilder<RegisterNgoBloc,RegisterNgoState>(
      buildWhen: (previous, current) => previous.submitRegisterNGOsStatus!=current.submitRegisterNGOsStatus,
      builder: (context, state) {
         return
                Theme_Button(
                  text: 'Register NGO', 
                  textColor: Colors.white, 
                  height: 55, 
                  width: double.infinity, 
                  bgColor: theme.primaryColor, 
                  isLoading: state.submitRegisterNGOsStatus==SubmitRegisterNGOsStatus.loading ? true : false,
                  onclick: ()async{                  
                    if(formKey.currentState!.validate())
                    {
                        context.read<RegisterNgoBloc>().add(OnregisterFormSubmitEvent());
                    }                   
                  });
    }));
  }
}