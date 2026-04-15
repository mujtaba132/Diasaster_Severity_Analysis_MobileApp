import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/request_ngo/request_ngo_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Btns.dart';
import 'package:fyp_project/utils/enums.dart';

class VerifystatusBtn extends StatelessWidget {
  final String ngoId;

  const VerifystatusBtn({super.key, required this.ngoId});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<RequestNgoBloc, RequestNgoState>(
      buildWhen: (previous, current) =>
    previous.ngoRequests != current.ngoRequests ||
    previous.verifyNGOsStatus != current.verifyNGOsStatus,
      builder: (context, state) {
        if(state.ngoRequests.isEmpty)
        {
          return  Text("Ngo Request list is empty");
        }
        final ngo = state.ngoRequests
            .firstWhere((e) => e.id == ngoId);

        bool isLoading = state.verifyNGOsStatus == VerifyNGOsStatus.loading &&
                            state.ngoRequests.any((e) => e.id == ngoId);
        return Theme_Button(
          height: 45,
          width: 110,
          textColor: Colors.white,
          text: ngo.isVerified! ? isLoading ?
              'Verifying...':'UnVerify' 
              :isLoading ? 'UnVerifying...':'Verify',
          bgColor: ngo.isVerified!
              ? Colors.red
              : Colors.green,
          onclick: isLoading? (){}:() {
            context.read<RequestNgoBloc>().add(
              OnVerifyNGOEvent(
                id: ngo.id!,
                isVerified: ngo.isVerified!,
              ),
            );
          },
        );
      },
    );
  }
}