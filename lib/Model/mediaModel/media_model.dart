import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp_project/utils/enums.dart';

part 'media_model.freezed.dart';
part 'media_model.g.dart';

@freezed
abstract class MediaModel with _$MediaModel{
      
      const factory MediaModel(
        {
        @Default('') @JsonKey(name: 'user_name') String? userName,
        @Default('') @JsonKey(name: 'user_token') String? userToken,
        @Default('') @JsonKey(name: 'user_profile_url') String? userProfileUrl,
        @Default('') @JsonKey(name: 'location') String? location,
        @Default('') @JsonKey(name: 'report_id') String? reportId,
        @Default('') @JsonKey(name: 'disaster_type') String? disasterType,
        @Default(0.0) @JsonKey(name: 'severity') double? severity,
        @Default('') @JsonKey(name: 'media_url') String? mediaUrl,
        @Default(CitizenFeedStatus.pending) @JsonKey(name: 'post_status') CitizenFeedStatus? status,
        @Default('') @JsonKey(name: 'time_stamp') String? timeStamp}
      ) = _MediaModel;

      factory MediaModel.fromJson(Map<String,dynamic> map) => _$MediaModelFromJson(map);

}

