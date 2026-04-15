import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/NGOs/NGOsVerify/NGOsRequests/requestsListCard.dart';
import 'package:fyp_project/blocs/request_ngo/request_ngo_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Exception.dart';
import 'package:fyp_project/config/Components/Custom_Loading.dart';
import 'package:fyp_project/utils/enums.dart';

class RequestListBuilder extends StatefulWidget {
  const RequestListBuilder({super.key});

  @override
  State<RequestListBuilder> createState() => _RequestListBuilderState();
}

class _RequestListBuilderState extends State<RequestListBuilder> 
   with SingleTickerProviderStateMixin {

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
    final theme=Theme.of(context);
    return  Expanded(
            child: BlocBuilder<RequestNgoBloc,RequestNgoState>(
              builder: (context, state) {
                
                if (state.loadNGOsRequestStatus == LoadNGOsRequestStatus.loading) {
                  return Center(child: CustomLoading(color: theme.primaryColor));
                } else if (state.loadNGOsRequestStatus == LoadNGOsRequestStatus.error) {
                  return Center(child: CustomException(message: state.error));
                } else if (state.filteredRequests.isEmpty) {
                  return Center( child: CustomException(message: 'No NGOs requests found'));
                }
                
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.filteredRequests.length,
                  itemBuilder: (context, index) {
                    final animation = Tween<double>(begin: 0, end: 1).animate(
                      CurvedAnimation(
                        parent: _controller,
                        curve: Interval(0.1 * index, 1, curve: Curves.easeOut),
                      ),
                    );
            
                    return FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(
                        scale: animation,
                        child: NGOListCard(
                          ngoModel: state.filteredRequests[index],
                          index: index,
                          isAdmin: true,
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