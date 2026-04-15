import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/NGOs/NGOsVerify/NGOsRequests/requestsListCard.dart';
import 'package:fyp_project/blocs/verify_ngo/verify_ngo_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Exception.dart';
import 'package:fyp_project/config/Components/Custom_Loading.dart';
import 'package:fyp_project/utils/enums.dart';

class VerifiedListBuilder extends StatefulWidget {
  const VerifiedListBuilder({super.key});

  @override
  State<VerifiedListBuilder> createState() => _VerifiedListBuilderState();
}

class _VerifiedListBuilderState extends State<VerifiedListBuilder> 
with SingleTickerProviderStateMixin{


  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
  final theme = Theme.of(context);
    return   
       Expanded(
              child: BlocBuilder<VerifyNgoBloc, VerifyNgoState>(
                 buildWhen: (previous, current) => 
                 previous.searchedNgos!=current.searchedNgos ||
                 previous.loadVerifiedNGOsStatus!=current.loadVerifiedNGOsStatus,
                builder: (context, state) {
                  if (state.loadVerifiedNGOsStatus ==
                      LoadVerifiedNGOsStatus.loading) {
                    return Center(
                      child: CustomLoading(color: theme.primaryColor),
                    );
                  } else if (state.loadVerifiedNGOsStatus ==
                      LoadVerifiedNGOsStatus.error) {
                    return Center(child: CustomException(message: state.error));
                  } else if (state.searchedNgos.isEmpty) {
                    return Center(
                      child: CustomException(message: "No verified NGO found"),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.searchedNgos.length,
                    itemBuilder: (context, index) {
                      final animation = Tween<double>(begin: 0, end: 1).animate(
                        CurvedAnimation(
                          parent: _controller,
                          curve: Interval(
                            0.1 * index,
                            1,
                            curve: Curves.easeOut,
                          ),
                        ),
                      );

                      return FadeTransition(
                        opacity: animation,
                        child: ScaleTransition(
                          scale: animation,
                          child: NGOListCard(
                            ngoModel: state.searchedNgos[index],
                            isAdmin: false,
                            index: index,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
  }
}