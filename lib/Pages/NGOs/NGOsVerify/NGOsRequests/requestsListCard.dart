import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Model/NGOModel/ngo_model.dart';
import 'package:fyp_project/Pages/NGOs/NGOsVerify/detailNGOs/verifyStatus.dart';
import 'package:fyp_project/blocs/request_ngo/request_ngo_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Btns.dart';
import 'package:fyp_project/config/routes/routes_arguments/NGOsdetail_screen_arguments.dart';
import 'package:fyp_project/config/routes/routes_name.dart';

class NGOListCard extends StatelessWidget {
  final NGOModel ngoModel;
  final bool isAdmin;
  final int index;
  const NGOListCard({super.key, required this.ngoModel, required this.isAdmin , required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black26 : Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: theme.primaryColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 25,
            backgroundColor: theme.primaryColor.withOpacity(0.1),
            child: Text(
              ngoModel.ngoName![0].toUpperCase(),
              style: TextStyle(
                color: theme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // NGO Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ngoModel.ngoName!,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  ngoModel.address!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.hintColor,
                  ),
                ),

                const SizedBox(height: 6),

                // Status badge
                isAdmin
                    ? Verifystatus(ngo: ngoModel,)
                    : Text(
                        ngoModel.phoneNo!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.primaryColor,
                        ),
                      ),
              ],
            ),
          ),

          // Button
          isAdmin
              ? Theme_Button(
                  text: 'View',
                  textColor: Colors.white,
                  height: 35,
                  width: 70,
                  bgColor: theme.primaryColor,
                  onclick: () {
                
                       Navigator.pushNamed(context, RoutesName.detailNGOScreen,
                       arguments: NgoDetailScreenArguments(ngoModel: ngoModel, requestNgoBloc: context.read<RequestNgoBloc>()));
                  },
                )
              : VerifystatusBox(isTrue: ngoModel.isVerified!)
        ],
      ),
    );
  }
}
