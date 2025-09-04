import 'package:json_annotation/json_annotation.dart';
import 'package:check_in_master/src/core/entities/location_data_entity.dart';

part 'location_data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LocationDataModel {
  final double lat;
  final double lng;

  const LocationDataModel({required this.lat, required this.lng});

  LocationDataEntity toEntity() => LocationDataEntity(lat: lat, lng: lng);

  factory LocationDataModel.fromEntity(LocationDataEntity entity) =>
      LocationDataModel(lat: entity.lat, lng: entity.lng);

  factory LocationDataModel.fromJson(Map<String, dynamic> json) =>
      _$LocationDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDataModelToJson(this);
}
