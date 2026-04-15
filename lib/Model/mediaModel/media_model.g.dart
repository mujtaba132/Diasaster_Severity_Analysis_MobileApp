// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MediaModel _$MediaModelFromJson(Map<String, dynamic> json) => _MediaModel(
  location: json['location'] as String? ?? '',
  reportId: json['report_id'] as String? ?? '',
  disasterType: json['disaster_type'] as String? ?? '',
  severity: (json['severity'] as num?)?.toDouble() ?? 0.0,
  mediaUrl: json['media_url'] as String? ?? '',
  status: json['status'] as String? ?? 'pending',
);

Map<String, dynamic> _$MediaModelToJson(_MediaModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'report_id': instance.reportId,
      'disaster_type': instance.disasterType,
      'severity': instance.severity,
      'media_url': instance.mediaUrl,
      'status': instance.status,
    };
