part of 'camera_bloc.dart';

class CamerasState extends Equatable {
  final File? preDisasterFile;
  final File? postDisasterFile;
  final double severityPercentage;
  final String severityLevel;
  final SubmitRequestStatus submitRequestStatus;
  final String address;
  final String error;
  const CamerasState({
    this.severityPercentage = 0.0,
    this.severityLevel = 'None',
    this.preDisasterFile,
    this.postDisasterFile,
    this.submitRequestStatus = SubmitRequestStatus.initail,
    this.address = '',
    this.error = '',
  });

  CamerasState copyWith({
    double? newSeverityPercentage,
    String? newSeverityLevel,
    File? newPreDisasterFile,
    File? newPostDisasterFile,
    SubmitRequestStatus? newSubmitRequestStatus,
    String? newAddress,
    String? newError,
  }) {
    return CamerasState(
      severityPercentage: newSeverityPercentage ?? severityPercentage,
      severityLevel: newSeverityLevel ?? severityLevel,
      preDisasterFile: newPreDisasterFile ?? preDisasterFile,
      postDisasterFile: newPostDisasterFile ?? postDisasterFile,
      submitRequestStatus: newSubmitRequestStatus ?? submitRequestStatus,
      address: newAddress ?? address,
      error: newError ?? error,
    );
  }

  @override
  List<Object?> get props => [
    severityPercentage,
    severityLevel,
    preDisasterFile,
    postDisasterFile,
    submitRequestStatus,
    address,
    error,
  ];
}
