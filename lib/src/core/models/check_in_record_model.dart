import 'package:check_in_master/src/core/entities/check_in_record_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'check_in_record_model.g.dart';

@JsonSerializable()
class CheckInRecordModel {
  @JsonKey(includeToJson: false)
  final String? id;
  final String userId;
  final String locationId;
  final int checkInDateTime;
  final int? checkOutDateTime;

  CheckInRecordModel({
    required this.id,
    required this.userId,
    required this.locationId,
    required this.checkInDateTime,
    this.checkOutDateTime,
  });

  factory CheckInRecordModel.fromJson(Map<String, dynamic> json) =>
      _$CheckInRecordModelFromJson(json);

  factory CheckInRecordModel.fromFirestore(
    Map<String, dynamic> json,
    String docId,
  ) => _$CheckInRecordModelFromJson(json).copyWith(id: docId);

  factory CheckInRecordModel.fromEntity(CheckInRecordEntity entity) =>
      CheckInRecordModel(
        id: entity.id,
        userId: entity.userId,
        locationId: entity.locationId,
        checkInDateTime: entity.checkInDateTime,
      );

  CheckInRecordEntity toEntity() => CheckInRecordEntity(
    id: id ?? '',
    userId: userId,
    locationId: locationId,
    checkInDateTime: checkInDateTime,
  );

  Map<String, dynamic> toJson() => _$CheckInRecordModelToJson(this);

  CheckInRecordModel copyWith({
    String? id,
    String? userId,
    String? locationId,
    int? checkInDateTime,
    int? checkOutDateTime,
  }) {
    return CheckInRecordModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      locationId: locationId ?? this.locationId,
      checkInDateTime: checkInDateTime ?? this.checkInDateTime,
      checkOutDateTime: checkOutDateTime ?? this.checkOutDateTime,
    );
  }
}
