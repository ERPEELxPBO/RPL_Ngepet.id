import 'package:equatable/equatable.dart';

final class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String username;
  final String no_telepon;
  final String role_id;
  final String imageUrl;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.username,
    this.no_telepon = "",
    this.role_id = "usr_usr",
    this.imageUrl = "https://firebasestorage.googleapis.com/v0/b/ngepet-id.appspot.com/o/imageUsers%2Fdokter_1.png?alt=media&token=6062cb87-4078-4b67-8f68-9b19e8743ad3"
  });

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        username,
        no_telepon,
        role_id,imageUrl,
      ];
}
