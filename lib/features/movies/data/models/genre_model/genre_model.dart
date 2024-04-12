import 'package:flutter_movie_box/features/movies/domain/entities/genre.dart';

import 'package:json_annotation/json_annotation.dart';

part 'genre_model.g.dart';

@JsonSerializable()
class GenreModel extends Genre {
  GenreModel({required super.id, required super.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenreModelToJson(this);
}
