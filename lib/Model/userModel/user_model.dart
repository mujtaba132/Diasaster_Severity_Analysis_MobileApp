import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp_project/utils/enums.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed()
abstract class UserModel with _$UserModel{

     const factory UserModel({
            @Default('') String id,
            @Default('') @JsonKey(name: 'email') String? email,
            @Default('') @JsonKey(name: 'user_name') String? userName,
            @Default('') @JsonKey(name: 'profile_url') String? profileUrl,
            @Default('') @JsonKey(name: 'token') String? token,
            @Default(Role.user) @JsonKey(name: 'role') Role? userRole,
     }) = _UserModel;


    factory UserModel.fromJson(Map<String,dynamic> json) => _$UserModelFromJson(json);
    
    factory UserModel.fromFirebase(Map<String,dynamic> map,String id) {
        return UserModel.fromJson(map).copyWith(id: id);
     }
}

