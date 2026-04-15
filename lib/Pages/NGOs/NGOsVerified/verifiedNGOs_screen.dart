import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/NGOs/NGOsVerified/verifiedListBuilder.dart';
import 'package:fyp_project/Pages/NGOs/NGOsVerified/verifiedNGOsSearch.dart';
import 'package:fyp_project/blocs/verify_ngo/verify_ngo_bloc.dart';
import 'package:fyp_project/config/routes/routes_name.dart';
import 'package:fyp_project/main.dart';

class VerifiedNGOsListScreen extends StatefulWidget {
  const VerifiedNGOsListScreen({super.key});

  @override
  State<VerifiedNGOsListScreen> createState() => _NGORequestListState();
}

class _NGORequestListState extends State<VerifiedNGOsListScreen>{
  TextEditingController textEditingController = TextEditingController();
  late VerifyNgoBloc _verifyNgoBloc;

  @override
  void initState() {
    super.initState();
    _verifyNgoBloc = VerifyNgoBloc(getit());
    _verifyNgoBloc.add(OnLoadVerifiedNGOsEvent());
  }

  @override
  void dispose() {
    _verifyNgoBloc.close();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Verified NGOs"), elevation: 0),
      body: BlocProvider.value(
        value:_verifyNgoBloc,
        child: Column(
          children: [
            const SizedBox(height: 10),

            VerifiedNGOsSreach(textEditingController: textEditingController),

            const SizedBox(height: 5),

            VerifiedListBuilder(),

           ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Register \n  NGO"),
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.registerNGOScreen);
        },
      ),
    );
  }
}
