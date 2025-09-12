// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['id'] as String?,
  name: json['name'] as String,
  email: json['email'] as String,
  isCheckedIn: json['isCheckedIn'] as bool,
  locationId: json['locationId'] as String?,
  checkInDateTime: (json['checkInDateTime'] as num?)?.toInt(),
  checkOutDateTime: (json['checkOutDateTime'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'isCheckedIn': instance.isCheckedIn,
  'locationId': instance.locationId,
  'checkInDateTime': instance.checkInDateTime,
  'checkOutDateTime': instance.checkOutDateTime,
};
