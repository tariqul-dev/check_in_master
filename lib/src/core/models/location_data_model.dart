import 'package:json_annotation/json_annotation.dart';
import 'package:check_in_master/src/core/entities/location_data.dart';

part 'location_data_model.g.dart';

@JsonSerializable()
class LocationDataModel extends LocationData {
  const LocationDataModel({
    required super.lat,
    required super.lng,
  });

  factory LocationDataModel.fromJson(Map<String, dynamic> json) =>
      _$LocationDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDataModelToJson(this);
}