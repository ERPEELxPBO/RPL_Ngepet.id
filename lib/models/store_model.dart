import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class StoreModels extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String address;
  final Timestamp
      createdAt; // Atribut untuk menyimpan informasi kapan toko dibuat
  final List<String>
      productIds; // Atribut untuk menyimpan daftar ID produk yang terkait dengan toko

  const StoreModels({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.createdAt,
    required this.productIds,
  });

  factory StoreModels.fromJson(String id, Map<String, dynamic> json) =>
      StoreModels(
          id: id,
          name: json['name'],
          imageUrl: json['imageUrl'],
          address: json['address'],
          createdAt: json['createdAt'],
          productIds: json['productIds']);

  @override
  List<Object?> get props =>
      [id, name, imageUrl, address, createdAt, productIds];
}
