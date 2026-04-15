part of 'request_ngo_bloc.dart';


sealed class RequestNgoEvent extends Equatable {
     const RequestNgoEvent();
     
       @override
       List<Object?> get props => [];
}

class OnSearchNGOsRequestEvent extends RequestNgoEvent{
       final String searchText;

       const OnSearchNGOsRequestEvent({required this.searchText});

      @override
      List<Object?> get props => [searchText]; 
}

class OnLoadNGORequestsEvent extends RequestNgoEvent{}

class OnVerifyNGOEvent extends RequestNgoEvent{

    final String id;
    final bool isVerified;
    const OnVerifyNGOEvent({required this.id,required this.isVerified});

      @override
      List<Object?> get props => [id,isVerified];
}

class OnChnageNGOFilterEvent extends RequestNgoEvent {
     
    final  NGOsFilterType ngosFilterType;

    const OnChnageNGOFilterEvent({required this.ngosFilterType});

    @override
      List<Object?> get props => [ngosFilterType];
}