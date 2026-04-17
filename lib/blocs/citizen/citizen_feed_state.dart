part of 'citizen_feed_bloc.dart';

class CitizenFeedState extends Equatable {

  final CitizenFeedstatus citizenFeedStatus;
  final List<MediaModel> citizenFeed;
  final Map<String,dynamic> citizenFeedMap;
  final String error;

  const CitizenFeedState( {
    this.citizenFeedStatus = CitizenFeedstatus.initail,
    this.citizenFeed = const[],
    this.citizenFeedMap = const {},
    this.error='',
    });
  
  CitizenFeedState copyWith ({
    CitizenFeedstatus? newcitizenFeedStatus,
    List<MediaModel>? newCitizenFeedList,
    Map<String,dynamic>? newCitizenFeedMap,
    String? newError
  })
  {
     return CitizenFeedState(
             citizenFeedStatus: newcitizenFeedStatus ?? citizenFeedStatus,
             citizenFeed: newCitizenFeedList ?? citizenFeed,
             citizenFeedMap: newCitizenFeedMap ?? citizenFeedMap,
             error: newError ?? error
     );
  }

  @override
  List<Object?> get props => [citizenFeedStatus,citizenFeed,citizenFeedMap,error];

}

