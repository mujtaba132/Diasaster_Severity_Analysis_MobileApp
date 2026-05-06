part of 'local_severity_bloc.dart';


class LocalSeverityState extends Equatable {

  final LocalSeverityStatus localSeverityStatus;
  final MediaUploadStatus mediaUploadStatus;
  final SubmitRequestStatus submitRequestStatus;
  final String uploadMediaUrl;
  final String uploadThumbnail;
  final List<MediaModel> localData;
  final List<MediaModel> searchedLocalData;
  final Map<String,dynamic> localMap;
  final String error;
  final String searchQuery;

  const LocalSeverityState({
      this.localSeverityStatus = LocalSeverityStatus.initail,
      this.mediaUploadStatus = MediaUploadStatus.initail,
      this.submitRequestStatus = SubmitRequestStatus.initail,
      this.uploadMediaUrl = '',
      this.uploadThumbnail = '',
      this.localData = const [],
      this.searchedLocalData = const [],
      this.localMap = const {},
      this.error = '',
      this.searchQuery = ''
  });

  LocalSeverityState copyWith({
      LocalSeverityStatus? newLocalServerityStatus,
      MediaUploadStatus? newMediaUploadStatus,
      SubmitRequestStatus? newSubmitRequestStatus,
      String? newUploadMediaUrl,
      String? newUploadThumbnail,
      List<MediaModel>? newlocalData,
      List<MediaModel>? newSearchLocalData,
      Map<String,dynamic>? newLocalMap,
      String? newError,
      String? newSearchQuery
  })
  {
     return LocalSeverityState(
      localSeverityStatus: newLocalServerityStatus ?? localSeverityStatus,
      mediaUploadStatus: newMediaUploadStatus ?? mediaUploadStatus,
      submitRequestStatus: newSubmitRequestStatus ?? submitRequestStatus,
      uploadMediaUrl: newUploadMediaUrl ?? uploadMediaUrl,
      uploadThumbnail: newUploadThumbnail ?? uploadThumbnail,
      localData: newlocalData ?? localData,
      searchedLocalData: newSearchLocalData ?? searchedLocalData,
      localMap: newLocalMap ?? localMap,
      error:  newError ?? error,
      searchQuery: newSearchQuery ?? searchQuery
     );
  }
  
  @override
  List<Object?> get props => [
    localSeverityStatus,
    mediaUploadStatus,
    submitRequestStatus,
    uploadMediaUrl,
    uploadThumbnail,
    localData,
    searchedLocalData,
    searchQuery,
    localMap,
    error];
}
