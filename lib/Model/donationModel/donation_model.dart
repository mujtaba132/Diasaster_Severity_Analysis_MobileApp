import 'package:freezed_annotation/freezed_annotation.dart';

part 'donation_model.freezed.dart';
part 'donation_model.g.dart';

@freezed
abstract class DonationModel with _$DonationModel{
     
    const factory DonationModel({
          @Default('') @JsonKey(name: 'ngoName') String? ngoName,
          @Default('') @JsonKey(name: 'bankName') String? bankName,
          @Default('') @JsonKey(name: 'accountNo') String? accountNo,
     })= _DonationModel;

    factory DonationModel.fromJson(Map<String,dynamic> json) => _$DonationModelFromJson(json);
} 