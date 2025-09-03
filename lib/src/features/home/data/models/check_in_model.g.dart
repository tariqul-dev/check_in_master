// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckInModel _$CheckInModelFromJson(Map<String, dynamic> json) => CheckInModel(
  inTime: (json['inTime'] as num).toInt(),
  locationData: LocationDataModel.fromJson(
    json['locationData'] as Map<String, dynamic>,
  ),
  name: json['name'] as String?,
  email: json['email'] as String?,
);

Map<String, dynamic> _$CheckInModelToJson(CheckInModel instance) =>
    <String, dynamic>{
      'inTime': instance.inTime,
      'name': instance.name,
      'email': instance.email,
      'locationData': instance.locationData.toJson(),
    };
