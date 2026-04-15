part of 'verify_ngo_bloc.dart';


class VerifyNgoState extends Equatable{

  final List<NGOModel> verifiedNgos;
  final List<NGOModel> searchedNgos;
  final LoadVerifiedNGOsStatus loadVerifiedNGOsStatus;
  final String error;
  final String searchText;

  const VerifyNgoState({
        this.verifiedNgos= const [],
        this.searchedNgos= const[],
        this.loadVerifiedNGOsStatus=LoadVerifiedNGOsStatus.initail,
        this.error='',
        this.searchText='',
        });
  

  VerifyNgoState copyWith ({
    List<NGOModel>? newVerifiedNgo,
    List<NGOModel>? newSearchNgos,
    String? newError,
    LoadVerifiedNGOsStatus? newLoadVerifiedNGOsStatus,
    String? newSearchText,
  })
  { 
       return VerifyNgoState(
        verifiedNgos: newVerifiedNgo ?? verifiedNgos,
        error: newError ?? error,
        loadVerifiedNGOsStatus: newLoadVerifiedNGOsStatus ?? loadVerifiedNGOsStatus,
        searchText: newSearchText ?? searchText,
        searchedNgos: newSearchNgos?? searchedNgos,
       );
  }

  @override
  List<Object?> get props => [verifiedNgos,error,loadVerifiedNGOsStatus,searchText,searchedNgos]; 
}
