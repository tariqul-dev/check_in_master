import 'package:json_annotation/json_annotation.dart';

import '../entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  @JsonKey(includeToJson: false)
  final String? id;
  final String name;
  final String email;

  final bool isCheckedIn;

  final String? locationId;
  final int? checkInDateTime;
  final int? checkOutDateTime;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.isCheckedIn,
    this.locationId,
    this.checkInDateTime,
    this.checkOutDateTime,
  });

  factory UserModel.fromEntity(UserEntity user) => UserModel(
    id: user.id,
    name: user.name,
    email: user.email,
    isCheckedIn: user.isCheckedIn,
    locationId: user.locationId,
    checkInDateTime: user.checkInDateTime,
    checkOutDateTime: user.checkOutDateTime,
  );

  UserEntity toEntity() => UserEntity(
    id: id ?? '',
    name: name,
    email: email,
    isCheckedIn: isCheckedIn,
    locationId: locationId,
    checkInDateTime: checkInDateTime,
    checkOutDateTime: checkOutDateTime,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromFirestore(Map<String, dynamic> json, String docId) =>
      _$UserModelFromJson(json).copyWith(id: docId);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    bool? isCheckedIn,
    String? locationId,
    int? checkInDateTime,
    int? checkOutDateTime,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      isCheckedIn: isCheckedIn ?? this.isCheckedIn,
      locationId: locationId ?? this.locationId,
      checkInDateTime: checkInDateTime ?? this.checkInDateTime,
      checkOutDateTime: checkOutDateTime ?? this.checkOutDateTime,
    );
  }
}
