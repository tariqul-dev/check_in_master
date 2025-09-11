// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationDataModel _$LocationDataModelFromJson(Map<String, dynamic> json) =>
    LocationDataModel(
      id: json['id'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      name: json['name'] as String,
      active: json['active'] as bool,
      createdAt: (json['createdAt'] as num).toInt(),
    );

Map<String, dynamic> _$LocationDataModelToJson(LocationDataModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
      'active': instance.active,
      'createdAt': instance.createdAt,
    };
