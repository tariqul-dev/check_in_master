// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermissionModel _$PermissionModelFromJson(Map<String, dynamic> json) =>
    PermissionModel(
      permissionStatus: $enumDecode(
        _$StatusEnumMap,
        json['permissionStatus'],
        unknownValue: Status.denied,
      ),
    );

Map<String, dynamic> _$PermissionModelToJson(PermissionModel instance) =>
    <String, dynamic>{
      'permissionStatus': _$StatusEnumMap[instance.permissionStatus]!,
    };

const _$StatusEnumMap = {
  Status.granted: 'granted',
  Status.denied: 'denied',
  Status.permanentlyDenied: 'permanentlyDenied',
};
