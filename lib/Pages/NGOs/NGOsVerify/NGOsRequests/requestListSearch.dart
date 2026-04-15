import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/request_ngo/request_ngo_bloc.dart';
import 'package:fyp_project/config/Components/Custom_SearchFeild.dart';

class RequestNGOsSreach extends StatelessWidget {
  final TextEditingController textEditingController;
  const RequestNGOsSreach({super.key, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestNgoBloc, RequestNgoState>(
      buildWhen: (previous, current) => current.searchText!=previous.searchText,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left:20.0,right: 20.0),
          child: AppSearchField(
            controller: textEditingController,
            hintText: 'search',
            onChanged: (query) {
              context.read<RequestNgoBloc>().add(OnSearchNGOsRequestEvent(searchText: query));
            },
          ),
        );
      },
    );
  }
}
