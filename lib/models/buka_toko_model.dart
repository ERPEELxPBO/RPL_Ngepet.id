import 'package:equatable/equatable.dart';

final class BukaTokoModel extends Equatable {
  final String id;
  final String userId;
  final String namaToko;
  final String deskripsiToko;
  final String alamatToko;
  final String namaPemilik;
  final String noTelepon;
  final String email;

  BukaTokoModel({
    required this.id,
    required this.userId,
    required this.namaToko,
    required this.deskripsiToko,
    required this.alamatToko,
    required this.namaPemilik,
    required this.noTelepon,
    required this.email,
  });

  BukaTokoModel copyWith({
    String? id,
    String? userId,
    String? namaToko,
    String? deskripsiToko,
    String? alamatToko,
    String? namaPemilik,
    String? noTelepon,
    String? email,
  }) {
    return BukaTokoModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      namaToko: namaToko ?? this.namaToko,
      deskripsiToko: deskripsiToko ?? this.deskripsiToko,
      alamatToko: alamatToko ?? this.alamatToko,
      namaPemilik: namaPemilik ?? this.namaPemilik,
      noTelepon: noTelepon ?? this.noTelepon,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        namaToko,
        deskripsiToko,
        alamatToko,
        namaPemilik,
        noTelepon,
        email,
      ];
}
