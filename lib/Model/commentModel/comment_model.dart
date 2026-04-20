import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
abstract class CommentModel  with _$CommentModel{
      
     const factory CommentModel({
            
            @Default('') @JsonKey(name: 'comment_id') String? commentId,
            @Default('') @JsonKey(name: 'user_name') String? userName,
            @Default('') @JsonKey(name: 'user_profile_url') String? userProfileUrl,
            @Default('') @JsonKey(name: 'comment') String? comment,
            @Default(false) @JsonKey(name: 'is_like') bool? isLike,
            @Default(0) @JsonKey(name: 'likes') int? likes,
            @JsonKey(name: 'time_stamp',fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime? timeStamp,

     }) = _CommentModel;


      factory CommentModel.fromJson(Map<String,dynamic> json) => _$CommentModelFromJson(json);

}

DateTime? dateTimeFromJson(dynamic value) {
  return value! == null ? null : value.toDate();
}

dynamic dateTimeToJson(DateTime? date) {
  return date;
}