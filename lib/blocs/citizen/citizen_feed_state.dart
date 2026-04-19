part of 'citizen_feed_bloc.dart';

class CitizenFeedState extends Equatable {

  final CitizenFeedstatus citizenFeedStatus;
  final CitizenFeedFilters citizenFeedFilter;
  final List<MediaModel> citizenFeed;
  final List<MediaModel> searchedFeed;
  final Map<String,dynamic> citizenFeedMap;
  final String error;
  final String searchQuery;

  const CitizenFeedState( {
    this.citizenFeedStatus = CitizenFeedstatus.initail,
    this.citizenFeedFilter = CitizenFeedFilters.all,
    this.searchedFeed = const [],
    this.citizenFeed = const[],
    this.citizenFeedMap = const {},
    this.searchQuery = '',
    this.error='',
    });
  
  CitizenFeedState copyWith ({
    CitizenFeedstatus? newcitizenFeedStatus,
    CitizenFeedFilters? newCitizenFeedFilter,
    List<MediaModel>? newCitizenFeedList,
    List<MediaModel>? newSearchedFeedList,
    Map<String,dynamic>? newCitizenFeedMap,
    String? newError,
    String? newSearchQuery
  })
  {
     return CitizenFeedState(
             citizenFeedStatus: newcitizenFeedStatus ?? citizenFeedStatus,
             citizenFeedFilter: newCitizenFeedFilter ?? citizenFeedFilter,
             citizenFeed: newCitizenFeedList ?? citizenFeed,
             searchedFeed: newSearchedFeedList ?? searchedFeed,
             citizenFeedMap: newCitizenFeedMap ?? citizenFeedMap,
             error: newError ?? error,
             searchQuery: newSearchQuery ?? searchQuery
     );
  }

  @override
  List<Object?> get props => [citizenFeedStatus,searchedFeed,citizenFeedFilter,citizenFeed,citizenFeedMap,error,searchQuery];

}

