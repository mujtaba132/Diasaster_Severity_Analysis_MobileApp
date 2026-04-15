part of 'request_ngo_bloc.dart';


class RequestNgoState extends Equatable {
  final List<NGOModel> ngoRequests;
  final List<NGOModel> filteredRequests;
  final LoadNGOsRequestStatus loadNGOsRequestStatus;
  final VerifyNGOsStatus verifyNGOsStatus;
  final NGOsFilterType ngosFilterType;
  final String searchText;
  final String error;


  const RequestNgoState({
        this.ngoRequests= const [],
        this.filteredRequests = const [],
        this.loadNGOsRequestStatus=LoadNGOsRequestStatus.initail,
        this.verifyNGOsStatus=VerifyNGOsStatus.initail,
        this.ngosFilterType=NGOsFilterType.all,
        this.searchText='',
        this.error='',
        });
  

  RequestNgoState copyWith ({
    List<NGOModel>? newNgoRequest,
    List<NGOModel>? newfilteredRequests,
    LoadNGOsRequestStatus? newLoadNGOsRequestStatus,
    VerifyNGOsStatus? newVerifyNGOStatus,
    NGOsFilterType? newNgoFilterType,
    String? newSearchText,
    String? newError,
  })
  { 
       return RequestNgoState(
        ngoRequests: newNgoRequest ?? ngoRequests,
        filteredRequests: newfilteredRequests ?? filteredRequests,
        loadNGOsRequestStatus: newLoadNGOsRequestStatus ?? loadNGOsRequestStatus,
        verifyNGOsStatus: newVerifyNGOStatus ?? verifyNGOsStatus,
        ngosFilterType: newNgoFilterType ?? ngosFilterType,
        searchText: newSearchText ?? searchText,
        error: newError ?? error,
       );
  }

  @override
  List<Object?> get props => [ngoRequests,searchText,error,loadNGOsRequestStatus,ngosFilterType,filteredRequests,verifyNGOsStatus]; 

}
