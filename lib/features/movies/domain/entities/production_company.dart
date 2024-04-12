import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ProductionCompany extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'logo_path')
  final String? logoPath;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'origin_country')
  final String originCountry;

  const ProductionCompany({
    required this.id,
    this.logoPath,
    required this.name,
    required this.originCountry,
  });

  @override
  String toString() {
    return 'ProductionCompany{id: $id, logoPath: $logoPath, name: $name, originCountry: $originCountry}';
  }

  @override
  List<Object?> get props => [id, logoPath, name, originCountry];
}
