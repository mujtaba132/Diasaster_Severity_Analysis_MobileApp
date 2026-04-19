part of 'user_feed_bloc.dart';

class UserFeedEvent extends Equatable {
  const UserFeedEvent();
  
  @override
  List<Object?> get props => [];
}


class OnUserFeedLoadEvent extends UserFeedEvent {}

class OnSearchUserFeedEvent extends UserFeedEvent {
       final String query;

       const OnSearchUserFeedEvent({required this.query});

       @override
        List<Object?> get props => [query];
}