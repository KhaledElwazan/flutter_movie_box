import 'package:dartz/dartz.dart';
import 'package:flutter_movie_box/core/error/exceptions.dart';
import 'package:flutter_movie_box/core/error/failure.dart';
import 'package:flutter_movie_box/features/movies/data/data_sources/favorite_movies_local_data_source.dart';
import 'package:flutter_movie_box/features/movies/data/models/movie_model/movie_model.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/movie.dart';
import 'package:flutter_movie_box/features/movies/domain/repositories/favorite_movies_repository.dart';

class FavoriteMoviesRepositoryImpl extends FavoriteMovieRepository {
  final FavoriteMoviesLocalDataSource favoriteMoviesLocalDataSource;

  FavoriteMoviesRepositoryImpl({required this.favoriteMoviesLocalDataSource});

  @override
  Future<Either<Failure, Unit>> addFavoriteMovie(Movie movie) async {
    try {
      final List<Movie> favorites =
          await favoriteMoviesLocalDataSource.getFavoriteMovies();
      favorites.add(movie);

      await favoriteMoviesLocalDataSource.addFavoriteMovies(
          favorites.map((m) => MovieModel.fromMovie(m)).toList());
      return const Right(unit);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getFavoriteMovies() async {
    try {
      final favorites = await favoriteMoviesLocalDataSource.getFavoriteMovies();
      return Right(favorites);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFavoriteMovie(int movieId) async {
    try {
      final List<Movie> favorites =
          await favoriteMoviesLocalDataSource.getFavoriteMovies();

      favorites.removeWhere((element) => element.id == movieId);

      // change from List<Movie> to List<MovieModel>
      final movieModels = favorites.map((e) => e as MovieModel).toList();

      await favoriteMoviesLocalDataSource.addFavoriteMovies(movieModels);

      return const Right(unit);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isFavoriteMovie(int movieId) async {
    try {
      final List<Movie> favorites =
          await favoriteMoviesLocalDataSource.getFavoriteMovies();
      final isFavorite = favorites.any((element) => element.id == movieId);
      return Right(isFavorite);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> clear() async {
    try {
      favoriteMoviesLocalDataSource.clear();
      return const Right(unit);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
