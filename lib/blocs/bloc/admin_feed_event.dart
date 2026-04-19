part of 'admin_feed_bloc.dart';

sealed class AdminFeedEvent extends Equatable {
  const AdminFeedEvent();
  
  @override
  List<Object?> get props => [];
}


class OnAdminFeedLoadEvent extends AdminFeedEvent {}

class OnChangePostStatusEvent extends AdminFeedEvent {
    
  final CitizenFeedStatus newStatus;
  final String reportId;
 
  const OnChangePostStatusEvent({required this.newStatus,required this.reportId});

   @override
  List<Object?> get props => [newStatus,reportId];
}

class OnChangePostFilterEvent extends AdminFeedEvent{

  final AdminFeedPostStatus newFilter;
 
  const OnChangePostFilterEvent({required this.newFilter});

   @override
  List<Object?> get props => [newFilter];
}


class OnChangeSearchFeildEvent extends AdminFeedEvent{
     
     final String query;

     const OnChangeSearchFeildEvent({required this.query});

     @override
     List<Object?> get props => [query];
}