import 'package:freezed_annotation/freezed_annotation.dart';

part 'ngo_model.freezed.dart';


@freezed
abstract class DashboardNgoModel with _$DashboardNgoModel {
  const factory DashboardNgoModel({
    @Default(0) int verifiedNGOs,
    @Default(0) int nonVerifyNGOs,
    @Default(0) int totalNgos,
  }) = _DashboardNgoModel;
}