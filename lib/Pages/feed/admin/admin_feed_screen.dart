import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/feed/admin/admin_feed_filters.dart';
import 'package:fyp_project/Pages/feed/admin/admin_feed_list.dart';
import 'package:fyp_project/Pages/feed/admin/admin_feed_search.dart';
import 'package:fyp_project/blocs/admin_feed/admin_feed_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Appbar.dart';
import 'package:fyp_project/main.dart';


class AdminFeedScreen extends StatefulWidget {
  const AdminFeedScreen({super.key});

  @override
  State<AdminFeedScreen> createState() => _AdminFeedScreenState();
}

class _AdminFeedScreenState extends State<AdminFeedScreen> {
  late AdminFeedBloc _adminFeedBloc;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _adminFeedBloc = AdminFeedBloc(getit())..add(OnAdminFeedLoadEvent());
  }

  @override
  void dispose() {
    _adminFeedBloc.close();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _adminFeedBloc,
      child: Scaffold(
        appBar: CustomAppbar(title: "Users Posts"),
        body: Column(
          children: [
            
            const SizedBox(height: 10),

            AdminFeedSearch(textEditingController: _textEditingController),
        
            const SizedBox(height: 15),
        
            AdminFeedFilterScreen(),
        
            const SizedBox(height: 15),
        
            AdminFeedList(),

          ],
        ),
      ),
    );
  }
}
