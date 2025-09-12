import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities/location_data_entity.dart';

part 'location_data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LocationDataModel {
  @JsonKey(includeToJson: false)
  final String? id;

  final double lat;
  final double lng;
  final String name;
  final bool active;
  final int createdAt;
  final List<String>? checkedInUserIds;

  const LocationDataModel({
    required this.id,
    required this.lat,
    required this.lng,
    required this.name,
    required this.active,
    required this.createdAt,
    this.checkedInUserIds,
  });

  LocationDataEntity toEntity() => LocationDataEntity(
    id: id ?? '',
    lat: lat,
    lng: lng,
    name: name,
    active: active,
    createdAt: createdAt,
    checkedInUserIds: checkedInUserIds ?? [],
  );

  factory LocationDataModel.fromEntity(LocationDataEntity entity) =>
      LocationDataModel(
        id: entity.id,
        lat: entity.lat,
        lng: entity.lng,
        name: entity.name,
        active: entity.active,
        createdAt: entity.createdAt,
        checkedInUserIds: entity.checkedInUserIds,
      );

  factory LocationDataModel.fromJson(Map<String, dynamic> json) =>
      _$LocationDataModelFromJson(json);

  factory LocationDataModel.fromFirestore(
    Map<String, dynamic> json,
    String docId,
  ) => _$LocationDataModelFromJson(json).copyWith(id: docId);

  Map<String, dynamic> toJson() => _$LocationDataModelToJson(this);

  LocationDataModel copyWith({
    String? id,
    double? lat,
    double? lng,
    String? name,
    bool? active,
    int? createdAt,
    List<String>? checkedInUserIds,
  }) {
    return LocationDataModel(
      id: id ?? this.id,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      name: name ?? this.name,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      checkedInUserIds: checkedInUserIds ?? this.checkedInUserIds,
    );
  }
}
