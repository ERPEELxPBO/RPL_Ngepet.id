import 'package:equatable/equatable.dart';

final class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String username;
  final String no_telepon;
  final String role_id;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.username,
    this.no_telepon = "",
    this.role_id = "3",
  });

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        username,
        no_telepon,
        role_id,
      ];
}
