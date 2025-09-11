import 'package:json_annotation/json_annotation.dart';
import 'package:check_in_master/src/core/entities/location_data_entity.dart';

part 'location_data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LocationDataModel {
  @JsonKey(includeToJson: false)
  final String id;

  final double lat;
  final double lng;
  final String name;
  final bool active;
  final int createdAt;

  const LocationDataModel({
    required this.id,
    required this.lat,
    required this.lng,
    required this.name,
    required this.active,
    required this.createdAt,
  });

  LocationDataEntity toEntity() => LocationDataEntity(
    id: id,
    lat: lat,
    lng: lng,
    name: name,
    active: active,
    createdAt: createdAt,
  );

  factory LocationDataModel.fromEntity(LocationDataEntity entity) =>
      LocationDataModel(
        id: entity.id,
        lat: entity.lat,
        lng: entity.lng,
        name: entity.name,
        active: entity.active,
        createdAt: entity.createdAt,
      );

  factory LocationDataModel.fromJson(Map<String, dynamic> json) =>
      _$LocationDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDataModelToJson(this);

  factory LocationDataModel.fromFirestore(
    String docId,
    Map<String, dynamic> json,
  ) {
    return LocationDataModel(
      id: docId,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      name: json['name'] as String,
      active: json['active'] as bool,
      createdAt: json['createdAt'] as int,
    );
  }
}
