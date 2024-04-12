import 'package:flutter_movie_box/features/movies/domain/entities/brief_movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brief_movie_model.g.dart';

@JsonSerializable()
class BriefMovieModel extends BriefMovie {
  const BriefMovieModel({
    required super.adult,
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  factory BriefMovieModel.fromJson(Map<String, dynamic> json) =>
      _$BriefMovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$BriefMovieModelToJson(this);
}
