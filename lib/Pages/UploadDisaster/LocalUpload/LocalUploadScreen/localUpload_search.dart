import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/local_severity/local_severity_bloc.dart';
import 'package:fyp_project/config/Components/Custom_SearchFeild.dart';

class LocaluploadSearch extends StatefulWidget {
  const LocaluploadSearch({super.key});

  @override
  State<LocaluploadSearch> createState() => _LocaluploadSearchState();
}

class _LocaluploadSearchState extends State<LocaluploadSearch> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalSeverityBloc, LocalSeverityState>(
      buildWhen: (previous, current) => previous.searchQuery!=current.searchQuery,
      builder: (context, state) {
        return AppSearchField(
          controller: _textEditingController,
          onChanged: (query) {
            context.read<LocalSeverityBloc>().add(
              OnSearchLocalSeverityEvent(query: query),
            );
          },
        );
      },
    );
  }
}
