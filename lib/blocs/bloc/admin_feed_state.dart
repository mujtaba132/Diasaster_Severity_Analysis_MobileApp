part of 'admin_feed_bloc.dart';


class AdminFeedState extends Equatable {

  final AdminFeedstatus adminFeedStatus;
  final AdminPoststatus adminPoststatus;
  final List<MediaModel> adminFeed;
  final List<MediaModel> searchedFeed;
  final AdminFeedPostStatus adminFeedFilter;
  final Map<String,dynamic> adminFeedMap;
  final String searchQuery;
  final String error;

  const AdminFeedState( {
    this.adminFeedStatus = AdminFeedstatus.initail,
    this.adminPoststatus = AdminPoststatus.initail,
    this.adminFeedFilter = AdminFeedPostStatus.all,
    this.adminFeed = const [],
    this.searchedFeed = const [],
    this.adminFeedMap = const {},
    this.searchQuery = '',
    this.error='',
    });
  
  AdminFeedState copyWith ({
    AdminFeedstatus? newAdminFeedStatus,
    AdminPoststatus? newAdminPostStatus,
    AdminFeedPostStatus? newAdminFilter,
    List<MediaModel>? newAdminFeedList,
    List<MediaModel>? newSearchedFeed,
    Map<String,dynamic>? newAdminFeedMap,
    String? newSearchQuery,
    String? newError
  })
  {
     return AdminFeedState(
             adminFeedStatus: newAdminFeedStatus ?? adminFeedStatus,
             adminPoststatus: newAdminPostStatus ?? adminPoststatus,
             adminFeedFilter: newAdminFilter ?? adminFeedFilter,
             adminFeed: newAdminFeedList ?? adminFeed,
             searchedFeed: newSearchedFeed ?? searchedFeed,
             adminFeedMap: newAdminFeedMap ?? adminFeedMap,
             searchQuery: newSearchQuery ?? searchQuery,
             error: newError ?? error
     );
  }

  @override
  List<Object?> get props => [adminFeedStatus,adminPoststatus,adminFeedFilter,adminFeed,searchedFeed,adminFeedMap,searchQuery,error];

}