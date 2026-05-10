part of 'admin_dashboard_bloc.dart';



class AdminDashboardState extends Equatable {

  final DashboardNgoModel ngoModel;
  final DashboardPostModel postModel;
  final DashboardUserModel userModel;
  final DashboardStatus dashboardStatus;
  final String error;

  const AdminDashboardState({
      this.ngoModel = const DashboardNgoModel(),
      this.postModel = const DashboardPostModel(),
      this.userModel = const DashboardUserModel(),
      this.dashboardStatus = DashboardStatus.initail,
      this.error = ''
  });

  AdminDashboardState copyWith({
        DashboardNgoModel? ngoModel,
        DashboardPostModel? postModel,
        DashboardUserModel? userModel,
        DashboardStatus? dashboardStatus,
        String? error
  }){
        return AdminDashboardState(
             ngoModel: ngoModel ?? this.ngoModel,
             postModel: postModel ?? this.postModel,
             userModel: userModel ?? this.userModel,
             dashboardStatus: dashboardStatus ?? this.dashboardStatus,
             error: error ?? this.error
        );
  }
  
  @override
  List<Object?> get props => [ngoModel,postModel,userModel,dashboardStatus,error];
}










