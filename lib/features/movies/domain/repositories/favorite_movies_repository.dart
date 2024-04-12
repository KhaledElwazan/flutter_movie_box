import 'package:dartz/dartz.dart';
import 'package:flutter_movie_box/core/error/failure.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/movie.dart';

abstract class FavoriteMovieRepository {
  Future<Either<Failure, bool>> isFavoriteMovie(int movieId);
  Future<Either<Failure, List<Movie>>> getFavoriteMovies();
  Future<Either<Failure, Unit>> addFavoriteMovie(Movie movie);
  Future<Either<Failure, Unit>> removeFavoriteMovie(int movieId);
  Future<Either<Failure, Unit>> clear();
}
