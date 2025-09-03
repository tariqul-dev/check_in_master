import 'package:check_in_master/src/core/models/location_data_model.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/check_in_entity.dart';

part 'check_in_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CheckInModel {
  final int inTime;
  final String? name;
  final String? email;
  final LocationDataModel locationData;

  const CheckInModel({
    required this.inTime,
    required this.locationData,
    this.name,
    this.email,
  });

  CheckInEntity toEntity() => CheckInEntity(
    inTime: inTime,
    locationData: locationData,
    name: name,
    email: email,
  );

  factory CheckInModel.fromEntity(CheckInEntity entity) => CheckInModel(
    inTime: entity.inTime,
    locationData: LocationDataModel(
      lat: entity.locationData.lat,
      lng: entity.locationData.lng,
    ),
    name: entity.name,
    email: entity.email,
  );

  factory CheckInModel.fromJson(Map<String, dynamic> json) =>
      _$CheckInModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckInModelToJson(this);
}
