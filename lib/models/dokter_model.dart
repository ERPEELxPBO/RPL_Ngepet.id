import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class DokterModels extends Equatable {
  final String id;
  final String name;
  final String deskripsi;
  final String imageUrl;
  final int harga;
  final bool availability; // ID toko tempat produk ini tersedia

  const DokterModels({
    required this.id,
    required this.name,
    required this.deskripsi,
    required this.imageUrl,
    required this.harga,
    required this.availability,
  });

  factory DokterModels.fromJson(String id, Map<String, dynamic> json) =>
      DokterModels(
          id: id,
          name: json['name'],
          deskripsi: json['deskripsi'],
          imageUrl: json['imageUrl'],
          harga: json['harga'],
          availability: json['availability']);
  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        harga,
        deskripsi,
        availability,
      ];
}
