import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class LocationPetModels extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final double jarak;

  const LocationPetModels({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.jarak,
  });

  factory LocationPetModels.fromJson(String id, Map<String, dynamic> json) =>
      LocationPetModels(
        id: id,
        name: json['name'],
        imageUrl: json['imageUrl'],
        jarak: json['jarak'],
      );
  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        jarak,
      ];
}
