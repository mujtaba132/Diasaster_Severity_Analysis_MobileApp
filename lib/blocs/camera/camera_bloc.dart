import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/repository/media_repository/pickMediaRepository.dart';
import 'package:fyp_project/repository/media_repository/mediaLocationRepository.dart';
import 'package:fyp_project/repository/model_predict_repository/model_predict_repository.dart';
import 'package:fyp_project/repository/sqlLite_media_repository/sqllite_media_repository.dart';
import 'package:fyp_project/utils/enums.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CamerasState> {
  final uuid = Uuid();

  PickMediaRepository pickMediaRepository;
  MediaLocationRepository locationMediaRepository;
  SQLLiteMediaRepository sqlLiteMediaRepository;
  ModelPredictRepository modelPredictRepository;

  CameraBloc(
    this.pickMediaRepository,
    this.locationMediaRepository,
    this.sqlLiteMediaRepository,
    this.modelPredictRepository,
  ) : super(CamerasState()) {
    on<OnPickPreDisasterImageEvent>(_onPickPreMedia);
    on<OnPickPostDisasterImageEvent>(_onPickPostMedia);
    on<OnStoreDataLocallyEvent>(_onSaveDataLocally);
  }

  void _onPickPreMedia(
    OnPickPreDisasterImageEvent event,
    Emitter<CamerasState> emit,
  ) async {
    emit(state.copyWith(newError: ''));

    await pickMediaRepository
        .pickDeviceMedia()
        .then((filePath) {
          emit(state.copyWith(newPreDisasterFile: File(filePath!)));
        })
        .onError((error, stackTrace) {
          emit(state.copyWith(newError: error.toString()));
        });
  }

  void _onPickPostMedia(
    OnPickPostDisasterImageEvent event,
    Emitter<CamerasState> emit,
  ) async {
    emit(state.copyWith(newError: ''));

    await pickMediaRepository
        .pickDeviceMedia()
        .then((filePath) {
          emit(state.copyWith(newPostDisasterFile: File(filePath!)));
        })
        .onError((error, stackTrace) {
          emit(state.copyWith(newError: error.toString()));
        });
  }

  void _onSaveDataLocally(
    OnStoreDataLocallyEvent event,
    Emitter<CamerasState> emit,
  ) async {
    if (state.preDisasterFile == null || state.postDisasterFile == null) {
      emit(
        state.copyWith(
          newError: 'Select file before get severity.',
          newSubmitRequestStatus: SubmitRequestStatus.error,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        newError: '',
        newSubmitRequestStatus: SubmitRequestStatus.loading,
      ),
    );

    try {
      double severityPercentage = 0.0;
      String severityLevel = 'Unknown';

      final result = await modelPredictRepository.predictImage(
        event.file,
        event.file2,
      );

      if (result.containsKey('severity')) {
        severityPercentage = result['severity'].toDouble();
      }

      if (result.containsKey('damage_intensity')) {
        severityLevel = result['damage_intensity'];
      }

      emit(
        state.copyWith(
          newSeverityLevel: severityLevel,
          newSeverityPercentage: severityPercentage,
          newSubmitRequestStatus: SubmitRequestStatus.success,
        ),
      );

      String mediaPath = await sqlLiteMediaRepository.storeFile(event.file);

      String currentDateTime = DateFormat(
        "dd MMM yyyy 'At' hh:mm a",
      ).format(DateTime.now());

      final model = MediaModel(
        reportId: uuid.v4(),
        disasterType: severityLevel,
        severity: severityPercentage,
        mediaUrl: mediaPath,
        timeStamp: currentDateTime,
        status: CitizenFeedStatus.pending,
      );

      await sqlLiteMediaRepository.insertData(model);
    } catch (e) {
      emit(
        state.copyWith(
          newError: e.toString(),
          newSubmitRequestStatus: SubmitRequestStatus.error,
        ),
      );
    }
  }
}
