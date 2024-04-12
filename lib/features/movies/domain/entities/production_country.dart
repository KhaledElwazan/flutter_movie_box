import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ProductionCountry extends Equatable {
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;

  @JsonKey(name: 'name')
  final String name;

  const ProductionCountry({required this.iso31661, required this.name});

  @override
  String toString() {
    return 'ProductionCountry{iso31661: $iso31661, name: $name}';
  }

  @override
  List<Object?> get props => [iso31661, name];
}
