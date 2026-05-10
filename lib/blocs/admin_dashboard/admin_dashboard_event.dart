part of 'admin_dashboard_bloc.dart';


sealed class AdminDashboardEvent extends Equatable{
  const AdminDashboardEvent();
  
  @override
  List<Object?> get props => [];
}


class OnLoadNgoDashboardEvent extends AdminDashboardEvent{}

class OnLoadUsersDashboardEvent extends AdminDashboardEvent{}

class OnLoadPostDashboardEvent extends AdminDashboardEvent{}