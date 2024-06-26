import 'package:equatable/equatable.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/genre.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/production_company.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/production_country.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/spoken_language.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Movie extends Equatable {
  @JsonKey(name: 'adult')
  final bool adult;

  @JsonKey(name: 'backdrop_path')
  final String backdropPath;

  @JsonKey(name: 'genres')
  final List<Genre> genres;

  @JsonKey(name: 'homepage')
  final String homepage;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'imdb_id')
  final String imdbId;

  @JsonKey(name: 'original_language')
  final String originalLanguage;

  @JsonKey(name: 'original_title')
  final String originalTitle;

  @JsonKey(name: 'overview')
  final String overview;

  @JsonKey(name: 'popularity')
  final double popularity;

  @JsonKey(name: 'poster_path')
  final String posterPath;

  @JsonKey(name: 'production_companies')
  final List<ProductionCompany> productionCompanies;

  @JsonKey(name: 'production_countries')
  final List<ProductionCountry> productionCountries;

  @JsonKey(name: 'release_date')
  final DateTime releaseDate;

  @JsonKey(name: 'revenue')
  final int revenue;

  @JsonKey(name: 'runtime')
  final int runtime;

  @JsonKey(name: 'spoken_languages')
  final List<SpokenLanguage> spokenLanguages;

  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'tagline')
  final String tagline;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'video')
  final bool video;

  @JsonKey(name: 'vote_average')
  final double voteAverage;

  @JsonKey(name: 'vote_count')
  final int voteCount;

  const Movie({
    required this.adult,
    required this.backdropPath,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genres,
        homepage,
        id,
        imdbId,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        productionCompanies,
        productionCountries,
        releaseDate,
        revenue,
        runtime,
        spokenLanguages,
        status,
        tagline,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}
