import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/request_ngo/request_ngo_bloc.dart';
import 'package:fyp_project/services/urls.dart';

class Verifystatus extends StatelessWidget {
  final NGOModel ngo;
  const Verifystatus({super.key, required this.ngo});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestNgoBloc, RequestNgoState>(
      buildWhen: (previous, current) => previous.verifyNGOsStatus!=current.verifyNGOsStatus,
      builder: (context, state) {
         final newNgo =  state.ngoRequests
            .firstWhere((e) => e.id == ngo.id);
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: newNgo.isVerified!
                ? Colors.green.withOpacity(0.15)
                : Colors.red.withOpacity(0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
             newNgo.isVerified! ? "Verified" : "UnVerified",
            style: TextStyle(
              fontSize: 10,
              color: newNgo.isVerified! ? Colors.green : Colors.red,
            ),
          ),
        );
      },
    );
  }
}


class VerifystatusBox extends StatelessWidget {
  final bool isTrue;
  const VerifystatusBox({super.key, required this.isTrue});

  @override
  Widget build(BuildContext context) {
    return 
         Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: isTrue
                ? Colors.green.withOpacity(0.15)
                : Colors.red.withOpacity(0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
             isTrue ? "Verified" : "UnVerified",
            style: TextStyle(
              fontSize: 10,
              color: isTrue ? Colors.green : Colors.red,
            )
          )
        );
  }
}

