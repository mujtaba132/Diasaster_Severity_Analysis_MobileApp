import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/UploadDisaster/LocalUpload/LocalUploadScreen/localUpload_search.dart';
import 'package:fyp_project/Pages/UploadDisaster/LocalUpload/LocalUploadScreen/localupload_list.dart';
import 'package:fyp_project/blocs/local_severity/local_severity_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Appbar.dart';
import 'package:fyp_project/config/routes/routes_name.dart';
import 'package:fyp_project/main.dart';

class LocalUploadScreen extends StatefulWidget {
  const LocalUploadScreen({super.key});

  @override
  State<LocalUploadScreen> createState() => _LocalUploadScreenState();
}

class _LocalUploadScreenState extends State<LocalUploadScreen> {
  late LocalSeverityBloc _localSeverityBloc;


  @override
  void initState() {
    super.initState();
    _localSeverityBloc = getit<LocalSeverityBloc>();
    _localSeverityBloc.add(OnLoadLocalSeverityEvent());
    
  }

  @override
  void dispose() {
    _localSeverityBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider.value(
      value: _localSeverityBloc,
      child: Scaffold(
        appBar: CustomAppbar(title: 'Severity Analysis'),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              
              LocaluploadSearch(),
              
              const SizedBox(height: 20),
          
              Expanded(child: DisasterList()),

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.primaryColor,
          child: Icon(Icons.camera_alt_outlined),
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.cameraScreen);
          },
        ),
      ),
    );
  }
}
