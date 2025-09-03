// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_out_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckOutModel _$CheckOutModelFromJson(Map<String, dynamic> json) =>
    CheckOutModel(
      inTime: (json['inTime'] as num).toInt(),
      locationData: LocationDataModel.fromJson(
        json['locationData'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$CheckOutModelToJson(CheckOutModel instance) =>
    <String, dynamic>{
      'inTime': instance.inTime,
      'locationData': instance.locationData.toJson(),
    };
