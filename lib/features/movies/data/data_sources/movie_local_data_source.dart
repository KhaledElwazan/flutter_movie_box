import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_movie_box/core/error/exceptions.dart';
import 'package:flutter_movie_box/features/movies/data/models/brief_movie_model/brief_movie_model.dart';
import 'package:flutter_movie_box/features/movies/data/models/movie_model/movie_model.dart';
import 'package:flutter_movie_box/features/movies/domain/usecases/get_movies.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MovieLocalDataSource {
  Future<Unit> cacheMovies(List<BriefMovieModel> moviesToCache,
      {MovieCategory category = MovieCategory.popular});
  Future<List<BriefMovieModel>> getCachedMovies(
      {MovieCategory category = MovieCategory.popular});

  Future<Unit> cacheMovieDetails(MovieModel movieToCache);
  Future<MovieModel> getCachedMovieDetails(int movieId);
}

// const String CACHED_MOVIES = 'CACHED_MOVIES';
const String CACHED_POPULAR_MOVIES = 'CACHED_POPULAR_MOVIES';
const String CACHED_TOP_RATED_MOVIES = 'CACHED_TOP_RATED_MOVIES';
const String CACHED_NOW_PLAYING_MOVIES = 'CACHED_NOW_PLAYING_MOVIES';
const String CACHED_UPCOMING_MOVIES = 'CACHED_UPCOMING_MOVIES';
const String CACHED_MOVIE_DETAILS = 'CACHED_MOVIE_DETAILS';

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  final SharedPreferences sharedPreferences;

  MovieLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cacheMovies(List<BriefMovieModel> moviesToCache,
      {MovieCategory category = MovieCategory.popular}) {
    final List<dynamic> moviesJsoned =
        moviesToCache.map((movie) => movie.toJson()).toList();
    sharedPreferences.setStringList(movieCategory2String(category),
        moviesJsoned.map((e) => e.toString()).toList());
    return Future.value(unit);
  }

  @override
  Future<List<BriefMovieModel>> getCachedMovies(
      {MovieCategory category = MovieCategory.popular}) {
    final List<String>? cachedMoviesJson =
        sharedPreferences.getStringList(movieCategory2String(category));

    if (cachedMoviesJson == null) {
      throw CacheException();
    }

    return Future.value(cachedMoviesJson
        .map(
          (movieJson) => BriefMovieModel.fromJson(
            json.decode(movieJson),
          ),
        )
        .toList());
  }

  String movieCategory2String(MovieCategory category) {
    switch (category) {
      case MovieCategory.popular:
        return CACHED_POPULAR_MOVIES;
      case MovieCategory.topRated:
        return CACHED_TOP_RATED_MOVIES;
      case MovieCategory.nowPlaying:
        return CACHED_NOW_PLAYING_MOVIES;
      case MovieCategory.upcoming:
        return CACHED_UPCOMING_MOVIES;
    }
  }

  @override
  Future<Unit> cacheMovieDetails(MovieModel movieToCache) {
    sharedPreferences.setString(
        CACHED_MOVIE_DETAILS, json.encode(movieToCache.toJson()));
    return Future.value(unit);
  }

  @override
  Future<MovieModel> getCachedMovieDetails(int movieId) {
    final String? cachedMovieJson =
        sharedPreferences.getString(CACHED_MOVIE_DETAILS);

    if (cachedMovieJson == null) {
      throw CacheException();
    }

    return Future.value(MovieModel.fromJson(json.decode(cachedMovieJson)));
  }
}
