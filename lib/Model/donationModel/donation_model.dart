
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp_project/utils/enums.dart';

part 'donation_model.freezed.dart';
part 'donation_model.g.dart';


@freezed
abstract class DonationModel with _$DonationModel{
     
    factory DonationModel({
          @Default('') @JsonKey(name: 'donationId') String? donationId,
          @Default(false) @JsonKey(name: 'isExpanded') bool? isExpanded,
          @Default(DonationMethod.card) @JsonKey(name: 'method') DonationMethod? method,
          @Default('') @JsonKey(name: 'ngoName') String? ngoName,
          @Default('') @JsonKey(name: 'bankName') String? bankName,
          @Default('') @JsonKey(name: 'accountNo') String? accountNo,
          @Default(0.0) @JsonKey(name: 'amount') double? amount,
          @Default('') @JsonKey(name: 'userId') String? userId,
          @Default('') @JsonKey(name: 'userEmail') String? userEmail,
          @Default('') @JsonKey(name: 'userprofile') String? userProfile,
          @JsonKey(name: 'timeStamp', fromJson: _dateTimeFromJson, toJson: _dateTimeToJson) DateTime? timeStamp,
     })= _DonationModel;

    factory DonationModel.fromJson(Map<String,dynamic> json) => _$DonationModelFromJson(json);

} 


DateTime? _dateTimeFromJson(Timestamp value) {
  return value.toDate();
}

dynamic _dateTimeToJson(DateTime? date) {
  return date;
}