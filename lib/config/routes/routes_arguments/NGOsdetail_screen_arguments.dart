import 'package:fyp_project/Model/NGOModel/ngo_model.dart';
import 'package:fyp_project/blocs/request_ngo/request_ngo_bloc.dart';

class NgoDetailScreenArguments {
   
    final NGOModel ngoModel;
    final RequestNgoBloc requestNgoBloc;

    const NgoDetailScreenArguments({
         required this.ngoModel,
         required this.requestNgoBloc,
    });
}