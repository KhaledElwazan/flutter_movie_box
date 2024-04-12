import 'package:flutter_movie_box/features/movies/domain/entities/production_company.dart';

import 'package:json_annotation/json_annotation.dart';

part 'production_company_model.g.dart';

@JsonSerializable()
class ProductionCompanyModel extends ProductionCompany {
  ProductionCompanyModel(
      {required super.id,
      required super.logoPath,
      required super.name,
      required super.originCountry});

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyModelToJson(this);
}
