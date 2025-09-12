// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckInRecordModel _$CheckInRecordModelFromJson(Map<String, dynamic> json) =>
    CheckInRecordModel(
      id: json['id'] as String?,
      userId: json['userId'] as String,
      locationId: json['locationId'] as String,
      checkInDateTime: (json['checkInDateTime'] as num).toInt(),
      checkOutDateTime: (json['checkOutDateTime'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CheckInRecordModelToJson(CheckInRecordModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'locationId': instance.locationId,
      'checkInDateTime': instance.checkInDateTime,
      'checkOutDateTime': instance.checkOutDateTime,
    };
