import 'package:flutter_movie_box/features/movies/data/models/genre_model/genre_model.dart';
import 'package:flutter_movie_box/features/movies/data/models/production_company_model/production_company_model.dart';
import 'package:flutter_movie_box/features/movies/data/models/production_country_model/production_country_model.dart';
import 'package:flutter_movie_box/features/movies/data/models/spoken_language_model/spoken_language_model.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends Movie {
  const MovieModel({
    required super.adult,
    required super.backdropPath,
    required super.genres,
    required super.homepage,
    required super.id,
    required super.imdbId,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.productionCompanies,
    required super.productionCountries,
    required super.releaseDate,
    required super.revenue,
    required super.runtime,
    required super.spokenLanguages,
    required super.status,
    required super.tagline,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

  factory MovieModel.fromMovie(Movie movie) {
    return MovieModel(
      backdropPath: movie.backdropPath,
      adult: movie.adult,
      genres: movie.genres,
      homepage: movie.homepage,
      id: movie.id,
      imdbId: movie.imdbId,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      popularity: movie.popularity,
      posterPath: movie.posterPath,
      productionCompanies: movie.productionCompanies,
      productionCountries: movie.productionCountries,
      releaseDate: movie.releaseDate,
      revenue: movie.revenue,
      runtime: movie.runtime,
      spokenLanguages: movie.spokenLanguages,
      status: movie.status,
      tagline: movie.tagline,
      title: movie.title,
      video: movie.video,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount,
    );
  }
}
