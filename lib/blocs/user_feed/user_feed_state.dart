part of 'user_feed_bloc.dart';

class UserFeedState extends Equatable {

  final UserFeedstatus userFeedStatus;
  final List<MediaModel> userFeed;
  final Map<String,dynamic> userFeedMap;
  final String error;

  const UserFeedState( {
    this.userFeedStatus = UserFeedstatus.initail,
    this.userFeed = const [],
    this.userFeedMap = const {},
    this.error='',
    });
  
  UserFeedState copyWith ({
    UserFeedstatus? newUserFeedStatus,
    List<MediaModel>? newuserFeedList,
    Map<String,dynamic>? newUserFeedMap,
    String? newError
  })
  {
     return UserFeedState(
             userFeedStatus: newUserFeedStatus ?? userFeedStatus,
             userFeed: newuserFeedList ?? userFeed,
             userFeedMap: newUserFeedMap ?? userFeedMap,
             error: newError ?? error
     );
  }

  @override
  List<Object?> get props => [userFeedStatus,userFeed,userFeedMap,error];

}

