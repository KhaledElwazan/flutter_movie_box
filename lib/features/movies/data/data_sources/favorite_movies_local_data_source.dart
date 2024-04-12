import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_movie_box/features/movies/data/models/movie_model/movie_model.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FavoriteMoviesLocalDataSource {
  Future<List<Movie>> getFavoriteMovies();
  Future<Unit> addFavoriteMovies(List<MovieModel> movieModels);
  Future<Unit> clear();
}

const String favoriteMoviesKey = 'FAVORITE_MOVIES';

class FavoriteMoviesLocalDataSourceImpl
    implements FavoriteMoviesLocalDataSource {
  final SharedPreferences sharedPreferences;

  FavoriteMoviesLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> addFavoriteMovies(List<MovieModel> movieModels) async {
    final List<String> moviesJsons = movieModels
        .map((movieModel) => jsonEncode(movieModel.toJson()))
        .toList();

    await sharedPreferences.setStringList(favoriteMoviesKey, moviesJsons);

    return Future.value(unit);
  }

  @override
  Future<List<Movie>> getFavoriteMovies() {
    final List<String>? moviesJsons =
        sharedPreferences.getStringList(favoriteMoviesKey);

    if (moviesJsons == null) {
      return Future.value([]);
    }

    final List<Movie> movies = moviesJsons
        .map((movieJson) => MovieModel.fromJson(jsonDecode(movieJson)))
        .toList();

    return Future.value(movies);
  }

  @override
  Future<Unit> clear() async {
    await sharedPreferences.remove(favoriteMoviesKey);

    return Future.value(unit);
  }
}
