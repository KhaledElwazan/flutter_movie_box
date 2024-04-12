import 'package:flutter_movie_box/features/movies/domain/entities/production_country.dart';

import 'package:json_annotation/json_annotation.dart';

part 'production_country_model.g.dart';

@JsonSerializable()
class ProductionCountryModel extends ProductionCountry {
  ProductionCountryModel({required super.iso31661, required super.name});

  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryModelToJson(this);
}
