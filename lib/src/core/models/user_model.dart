import 'package:freezed_annotation/freezed_annotation.dart';

import '../../features/auth/domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  final String name;
  final String email;
  final int? checkInDateTime;
  final int? checkOutDateTime;

  UserModel({
    required this.name,
    required this.email,
    required this.checkInDateTime,
    required this.checkOutDateTime,
  });

  factory UserModel.fromEntity(UserEntity user) => UserModel(
    name: user.name,
    email: user.email,
    checkInDateTime: user.checkInDateTime,
    checkOutDateTime: user.checkOutDateTime,
  );

  UserEntity toEntity() => UserEntity(
    name: name,
    email: email,
    checkInDateTime: checkInDateTime,
    checkOutDateTime: checkOutDateTime,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
