import 'package:check_in_master/src/core/models/location_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/check_out_entity.dart';

part 'check_out_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CheckOutModel {
  final int inTime;
  final LocationDataModel locationData;

  const CheckOutModel({
    required this.inTime,
    required this.locationData,
  });

  CheckOutEntity toEntity() => CheckOutEntity(
    inTime: inTime,
    locationData: locationData.toEntity(),
  );

  factory CheckOutModel.fromEntity(CheckOutEntity entity) => CheckOutModel(
    inTime: entity.inTime,
    locationData: LocationDataModel(
      lat: entity.locationData.lat,
      lng: entity.locationData.lng,
    ),
  );

  factory CheckOutModel.fromJson(Map<String, dynamic> json) =>
      _$CheckOutModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckOutModelToJson(this);
}
