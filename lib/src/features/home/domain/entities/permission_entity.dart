import 'package:equatable/equatable.dart';

enum Status { granted, denied, permanentlyDenied }

class PermissionEntity extends Equatable {
  final Status permissionStatus;

  const PermissionEntity({required this.permissionStatus});

  @override
  List<Object?> get props => [permissionStatus];
}
