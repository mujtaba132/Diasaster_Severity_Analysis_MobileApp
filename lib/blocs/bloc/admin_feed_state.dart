part of 'admin_feed_bloc.dart';


class AdminFeedState extends Equatable {

  final AdminFeedstatus adminFeedStatus;
  final AdminPoststatus adminPoststatus;
  final List<MediaModel> adminFeed;
  final Map<String,dynamic> adminFeedMap;
  final String error;

  const AdminFeedState( {
    this.adminFeedStatus = AdminFeedstatus.initail,
    this.adminPoststatus = AdminPoststatus.initail,
    this.adminFeed = const[],
    this.adminFeedMap = const {},
    this.error='',
    });
  
  AdminFeedState copyWith ({
    AdminFeedstatus? newAdminFeedStatus,
    AdminPoststatus? newAdminPostStatus,
    List<MediaModel>? newAdminFeedList,
    Map<String,dynamic>? newAdminFeedMap,
    String? newError
  })
  {
     return AdminFeedState(
             adminFeedStatus: newAdminFeedStatus ?? adminFeedStatus,
             adminPoststatus: newAdminPostStatus ?? adminPoststatus,
             adminFeed: newAdminFeedList ?? adminFeed,
             adminFeedMap: newAdminFeedMap ?? adminFeedMap,
             error: newError ?? error
     );
  }

  @override
  List<Object?> get props => [adminFeedStatus,adminPoststatus,adminFeed,adminFeedMap,error];

}