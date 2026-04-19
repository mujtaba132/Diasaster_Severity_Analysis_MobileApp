import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/feed/citizen/citizen_feed_filters.dart';
import 'package:fyp_project/Pages/feed/citizen/citizen_feed_list.dart';
import 'package:fyp_project/Pages/feed/citizen/citizen_feed_search.dart';
import 'package:fyp_project/blocs/citizen/citizen_feed_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Appbar.dart';
import 'package:fyp_project/main.dart';


class CitizenFeedListScreen extends StatefulWidget {
  const CitizenFeedListScreen({super.key});

  @override
  State<CitizenFeedListScreen> createState() => _CitizenFeedListScreenState();
}

class _CitizenFeedListScreenState extends State<CitizenFeedListScreen> {
  late CitizenFeedBloc _citizenFeedBloc;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _citizenFeedBloc = CitizenFeedBloc(getit())..add(OnCitizenFeedLoadEvent());
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _citizenFeedBloc.close();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider.value(
      value: _citizenFeedBloc,
      child: Scaffold(
        appBar: CustomAppbar(title: "Today Updates"),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Column(
            children: [
          
              CitizenFeedSearch(textEditingController: _textEditingController),

              const SizedBox(height: 15),
             
              CitizenFeedFiltersScreen(),
               
              const SizedBox(height: 15),
          
              CitizenFeedList(),
              
            ],
          ),
        ),
      ),
    );
  }
}
