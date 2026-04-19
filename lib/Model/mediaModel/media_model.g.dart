// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MediaModel _$MediaModelFromJson(Map<String, dynamic> json) => _MediaModel(
  userName: json['user_name'] as String? ?? '',
  userToken: json['user_token'] as String? ?? '',
  userProfileUrl: json['user_profile_url'] as String? ?? '',
  location: json['location'] as String? ?? '',
  reportId: json['report_id'] as String? ?? '',
  disasterType: json['disaster_type'] as String? ?? '',
  severity: (json['severity'] as num?)?.toDouble() ?? 0.0,
  mediaUrl: json['media_url'] as String? ?? '',
  videoThumbnail: json['video_thumbnail'] as String? ?? '',
  status:
      $enumDecodeNullable(_$CitizenFeedStatusEnumMap, json['post_status']) ??
      CitizenFeedStatus.pending,
  timeStamp: json['time_stamp'] as String? ?? '',
);

Map<String, dynamic> _$MediaModelToJson(_MediaModel instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'user_token': instance.userToken,
      'user_profile_url': instance.userProfileUrl,
      'location': instance.location,
      'report_id': instance.reportId,
      'disaster_type': instance.disasterType,
      'severity': instance.severity,
      'media_url': instance.mediaUrl,
      'video_thumbnail': instance.videoThumbnail,
      'post_status': _$CitizenFeedStatusEnumMap[instance.status],
      'time_stamp': instance.timeStamp,
    };

const _$CitizenFeedStatusEnumMap = {
  CitizenFeedStatus.pending: 'pending',
  CitizenFeedStatus.processing: 'processing',
  CitizenFeedStatus.approved: 'approved',
};
