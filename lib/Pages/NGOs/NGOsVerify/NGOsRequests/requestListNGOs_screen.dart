import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/NGOs/NGOsVerify/NGOsRequests/requestListBuilder.dart';
import 'package:fyp_project/Pages/NGOs/NGOsVerify/NGOsRequests/requestListFilters.dart';
import 'package:fyp_project/Pages/NGOs/NGOsVerify/NGOsRequests/requestListSearch.dart';
import 'package:fyp_project/blocs/request_ngo/request_ngo_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Appbar.dart';
import 'package:fyp_project/main.dart';


class NGORequestListScreen extends StatefulWidget {
  const NGORequestListScreen({super.key});

  @override
  State<NGORequestListScreen> createState() => _NGORequestListState();
}

class _NGORequestListState extends State<NGORequestListScreen>
    with SingleTickerProviderStateMixin {
  late RequestNgoBloc  _ngoRequestsBloc;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _ngoRequestsBloc=RequestNgoBloc(getit());
    _ngoRequestsBloc.add(OnLoadNGORequestsEvent());
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _ngoRequestsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider.value(
      value: _ngoRequestsBloc,
      child: Scaffold(
        appBar: CustomAppbar(title: 'Requests by NGOs'),
        body: Column(
          children: [

            const SizedBox(height: 10),
              
            RequestNGOsSreach(textEditingController: _textEditingController,), 
            
            const SizedBox(height: 15),

            NGOsFilters(),
        
            RequestListBuilder(),
        
              ],
        ),
      ),
    );
  }
}
