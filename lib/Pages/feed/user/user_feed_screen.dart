import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/feed/user/user_feed_list.dart';
import 'package:fyp_project/Pages/feed/user/user_feed_search.dart';
import 'package:fyp_project/blocs/user_feed/user_feed_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Appbar.dart';
import 'package:fyp_project/main.dart';


class UserFeedListScreen extends StatefulWidget {
  const UserFeedListScreen({super.key});

  @override
  State<UserFeedListScreen> createState() => _UserFeedListScreenState();
}

class _UserFeedListScreenState extends State<UserFeedListScreen> {
  late UserFeedBloc _userFeedBloc;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _userFeedBloc = UserFeedBloc(getit())..add(OnUserFeedLoadEvent());
  }

  @override
  void dispose() {
    _userFeedBloc.close();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider.value(
      value: _userFeedBloc,
      child: Scaffold(
        appBar: CustomAppbar(title: "Yours Posts"),
        body: Column(
           children: [
                   
                   const SizedBox(height: 10),
        
                   UserFeedSearch(textEditingController: _textEditingController),
        
                   const SizedBox(height: 15),
        
                  UserFeedList(),
        
           ],
        ),
      )
    );
  }
}
