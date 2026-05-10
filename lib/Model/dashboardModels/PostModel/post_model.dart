import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';

@freezed
abstract class DashboardPostModel with _$DashboardPostModel {
  const factory DashboardPostModel({
    @Default(0) int verifiedPosts,
    @Default(0) int nonVerifyPosts,
    @Default(0) int totalPosts,
  }) = _DashboardPostModel;
}