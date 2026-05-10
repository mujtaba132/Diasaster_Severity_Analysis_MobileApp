
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
abstract class DashboardUserModel with _$DashboardUserModel {
  const factory DashboardUserModel({
    @Default(0) int totalAdmins,
    @Default(0) int totalNormalUsers,
    @Default(0) int totalUsers,
  }) = _DashboardUserModel;
}