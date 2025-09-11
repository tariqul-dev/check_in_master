// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterInputModel _$RegisterInputModelFromJson(Map<String, dynamic> json) =>
    RegisterInputModel(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegisterInputModelToJson(RegisterInputModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
