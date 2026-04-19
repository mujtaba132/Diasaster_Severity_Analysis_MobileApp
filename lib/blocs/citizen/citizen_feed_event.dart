part of 'citizen_feed_bloc.dart';


class CitizenFeedEvent extends Equatable {
  const CitizenFeedEvent();
  
  @override
  List<Object?> get props => [];
}


class OnCitizenFeedLoadEvent extends CitizenFeedEvent {}

class OnSearchFeedEvent extends CitizenFeedEvent {
     
     final String query;

     const OnSearchFeedEvent({required this.query});

     @override
     List<Object?> get props => [query];
}

class OnChangeFeedFilterEvent extends CitizenFeedEvent{
    
    final CitizenFeedFilters citizenFeedFilter;

    const OnChangeFeedFilterEvent({required this.citizenFeedFilter});

    @override
    List<Object?> get props => [citizenFeedFilter];
}