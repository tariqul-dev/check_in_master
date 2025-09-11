import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/register_input_entity.dart';

part 'register_input_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterInputModel {
  final String name;
  final String email;
  final String password;

  RegisterInputModel({
    required this.name,
    required this.email,
    required this.password,
  });

  factory RegisterInputModel.fromEntity(RegisterInputEntity entity) =>
      RegisterInputModel(
        name: entity.name,
        email: entity.email,
        password: entity.password,
      );

  RegisterInputEntity toEntity() =>
      RegisterInputEntity(name: name, email: email, password: password);

  Map<String, dynamic> toJson() => _$RegisterInputModelToJson(this);
}
