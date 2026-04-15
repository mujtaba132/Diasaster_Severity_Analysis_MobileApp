part of 'verify_ngo_bloc.dart';


abstract class VerifyNgoEvent extends Equatable {
       const VerifyNgoEvent();
 
  @override
  List<Object?> get props => [];
}


class OnLoadVerifiedNGOsEvent extends VerifyNgoEvent{}

class OnSearchVerifiedNGOsEvent extends VerifyNgoEvent{
    
    final String searchText;

    const OnSearchVerifiedNGOsEvent({required this.searchText});

    @override
    List<Object> get props => [searchText];
}