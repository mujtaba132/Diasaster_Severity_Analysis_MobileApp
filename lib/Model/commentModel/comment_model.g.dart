// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommentModel _$CommentModelFromJson(Map<String, dynamic> json) =>
    _CommentModel(
      commentId: json['comment_id'] as String? ?? '',
      userName: json['user_name'] as String? ?? '',
      userProfileUrl: json['user_profile_url'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
      isLike: json['is_like'] as bool? ?? false,
      likes: (json['likes'] as num?)?.toInt() ?? 0,
      timeStamp: dateTimeFromJson(json['time_stamp']),
    );

Map<String, dynamic> _$CommentModelToJson(_CommentModel instance) =>
    <String, dynamic>{
      'comment_id': instance.commentId,
      'user_name': instance.userName,
      'user_profile_url': instance.userProfileUrl,
      'comment': instance.comment,
      'is_like': instance.isLike,
      'likes': instance.likes,
      'time_stamp': dateTimeToJson(instance.timeStamp),
    };
