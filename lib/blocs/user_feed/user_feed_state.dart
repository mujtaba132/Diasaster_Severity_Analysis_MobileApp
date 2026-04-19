part of 'user_feed_bloc.dart';

class UserFeedState extends Equatable {

  final UserFeedstatus userFeedStatus;
  final List<MediaModel> userFeed;
  final List<MediaModel> searchedFeed;
  final Map<String,dynamic> userFeedMap;
  final String searchQuery;
  final String error;

  const UserFeedState( {
    this.userFeedStatus = UserFeedstatus.initail,
    this.userFeed = const [],
    this.searchedFeed = const [],
    this.userFeedMap = const {},
    this.searchQuery = '',
    this.error='',
    });
  
  UserFeedState copyWith ({
    UserFeedstatus? newUserFeedStatus,
    List<MediaModel>? newuserFeedList,
    List<MediaModel>? newSearchFeedList,
    Map<String,dynamic>? newUserFeedMap,
    String? newSearchQuery,
    String? newError
  })
  {
     return UserFeedState(
             userFeedStatus: newUserFeedStatus ?? userFeedStatus,
             userFeed: newuserFeedList ?? userFeed,
             searchedFeed: newSearchFeedList ?? searchedFeed,
             userFeedMap: newUserFeedMap ?? userFeedMap,
             searchQuery: newSearchQuery ?? searchQuery,
             error: newError ?? error
     );
  }

  @override
  List<Object?> get props => [userFeedStatus,userFeed,searchedFeed,userFeedMap,error,searchQuery];

}

