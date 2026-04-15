import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'ngo_model.freezed.dart';
part 'ngo_model.g.dart';

@freezed
abstract class NGOModel with _$NGOModel{
     
     const factory NGOModel({
           @Default('') String? id,
           @Default('') @JsonKey(name: 'ngoName') String? ngoName,
           @Default('') @JsonKey(name: 'address') String? address,
           @Default('') @JsonKey(name: 'phoneNo') String? phoneNo,
           @Default('') @JsonKey(name: 'bankName') String? bankName,
           @Default('') @JsonKey(name: 'accountNo') String? accountNo,
           @Default(false) @JsonKey(name: 'isVerified') bool? isVerified,
           @Default('') @JsonKey(name: 'certificateUrl') String? cerficateUrl,
     }) =_NGOModel;

     factory NGOModel.fromJson(Map<String,dynamic> map) => _$NGOModelFromJson(map);
           @override
           Map<String,dynamic> toJson() => _$NGOModelToJson(_NGOModel()); 
     factory NGOModel.fromFirebase(Map<String,dynamic> map,String id) {
        return NGOModel.fromJson(map).copyWith(id: id);
     }
}