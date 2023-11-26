import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ProductModels extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String kategori;
  final String merkProduk;
  final String deskripsi;
  final int hargaSatuan;
  final int stok;
  final Timestamp tanggalKadaluwarsa;
  final Timestamp tanggalProduksi;
  final String storeId; // ID toko tempat produk ini tersedia

  const ProductModels({
    required this.id,
    required this.name,
    required this.deskripsi,
    required this.imageUrl,
    required this.kategori,
    required this.merkProduk,
    required this.hargaSatuan,
    required this.stok,
    required this.tanggalKadaluwarsa,
    required this.tanggalProduksi,
    required this.storeId,
  });

  factory ProductModels.fromJson(String id, Map<String, dynamic> json) =>
      ProductModels(
        id: id,
        name: json['name'],
        deskripsi: json['deskripsi'],
        imageUrl: json['imageUrl'],
        kategori: json['kategori'],
        merkProduk: json['merkProduk'],
        hargaSatuan: json['hargaSatuan'],
        stok: json['stok'],
        tanggalKadaluwarsa: json['tanggalKadaluwarsa'],
        tanggalProduksi: json['tanggalProduksi'],
        storeId: json['storeId'],
      );
  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        kategori,
        merkProduk,
        hargaSatuan,
        stok,
        tanggalKadaluwarsa,
        tanggalProduksi,
        storeId,
        deskripsi,
      ];
}
