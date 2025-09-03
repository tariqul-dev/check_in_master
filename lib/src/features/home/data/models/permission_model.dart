import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/permission_entity.dart';

part 'permission_model.g.dart';

@JsonSerializable()
class PermissionModel {
  @JsonKey(unknownEnumValue: Status.denied)
  final Status permissionStatus;

  const PermissionModel({required this.permissionStatus});

  PermissionEntity toEntity() =>
      PermissionEntity(permissionStatus: permissionStatus);

  factory PermissionModel.fromEntity(PermissionEntity entity) =>
      PermissionModel(permissionStatus: entity.permissionStatus);

  factory PermissionModel.fromJson(Map<String, dynamic> json) =>
      _$PermissionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionModelToJson(this);
}
