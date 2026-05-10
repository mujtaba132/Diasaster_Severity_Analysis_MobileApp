import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fyp_project/Model/dashboardModels/NgoModel/ngo_model.dart';
import 'package:fyp_project/Model/dashboardModels/PostModel/post_model.dart';
import 'package:fyp_project/Model/dashboardModels/UserModel/user_model.dart';
import 'package:fyp_project/repository/dashboardRepository/dashboard_ngos.dart';
import 'package:fyp_project/repository/dashboardRepository/dashboard_posts.dart';
import 'package:fyp_project/repository/dashboardRepository/dashboard_users.dart';
import 'package:fyp_project/utils/enums.dart';

part 'admin_dashboard_event.dart';
part 'admin_dashboard_state.dart';


class AdminDashboardBloc extends Bloc<AdminDashboardEvent, AdminDashboardState> {

  final DashboardUsersRepository usersRepository;
  final DashboardNgoRepository ngoRepository;
  final DashboardPostRepository postRepository;
  AdminDashboardBloc(
    this.ngoRepository,
    this.postRepository,
    this.usersRepository,
  ) : super(AdminDashboardState()) {
    on<OnLoadNgoDashboardEvent>(_onLoadNgoDashboard);
    on<OnLoadUsersDashboardEvent>(_onLoadUserDashboard);
    on<OnLoadPostDashboardEvent>(_onLoadPostDashboard);
  }


  Future<void> _onLoadNgoDashboard(OnLoadNgoDashboardEvent event,Emitter<AdminDashboardState> emit) async{

        emit(state.copyWith(error: '',dashboardStatus: DashboardStatus.loading)); 

                       await emit.forEach(
                        ngoRepository.getNgoDashboardModel(), 
                        onData: (ngo) {

                              return state.copyWith(
                                ngoModel: ngo,
                                dashboardStatus: DashboardStatus.success
                              ); 

                        },
                        onError: (error, stackTrace) {
                          return 
                               state.copyWith(error: error.toString(),dashboardStatus: DashboardStatus.error);
                        },);   
   
     
  }

  Future<void> _onLoadUserDashboard(OnLoadUsersDashboardEvent event,Emitter<AdminDashboardState> emit) async{

        emit(state.copyWith(error: '',dashboardStatus: DashboardStatus.loading)); 

                       await emit.forEach(
                        usersRepository.getUserDashboardModel(), 
                        onData: (users) {
                              return state.copyWith(
                                userModel: users,
                                dashboardStatus: DashboardStatus.success
                              ); 

                        },
                        onError: (error, stackTrace) {
                          return 
                               state.copyWith(error: error.toString(),dashboardStatus: DashboardStatus.error);
                        },);   
   
     
  }

    Future<void> _onLoadPostDashboard(OnLoadPostDashboardEvent event,Emitter<AdminDashboardState> emit) async{

        emit(state.copyWith(error: '',dashboardStatus: DashboardStatus.loading)); 

                       await emit.forEach(
                        postRepository.getPostDashboardModel(), 
                        onData: (posts) {

                              return state.copyWith(
                                postModel: posts,
                                dashboardStatus: DashboardStatus.success
                              ); 

                        },
                        onError: (error, stackTrace) {
                          return 
                               state.copyWith(error: error.toString(),dashboardStatus: DashboardStatus.error);
                        },);   
   
     
  }


}
