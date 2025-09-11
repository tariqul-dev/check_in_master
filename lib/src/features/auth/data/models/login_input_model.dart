import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/login_input_entity.dart';

part 'login_input_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginInputModel {
  final String email;
  final String password;

  const LoginInputModel({required this.email, required this.password});

  factory LoginInputModel.fromEntity(LoginInputEntity entity) =>
      LoginInputModel(email: entity.email, password: entity.password);

  LoginInputEntity toEntity() =>
      LoginInputEntity(email: email, password: password);

  Map<String, dynamic> toJson() => _$LoginInputModelToJson(this);
}
