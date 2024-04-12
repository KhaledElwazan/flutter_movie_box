import 'package:dartz/dartz.dart';
import 'package:flutter_movie_box/core/error/failure.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/movie.dart';
import 'package:flutter_movie_box/features/movies/domain/repositories/favorite_movies_repository.dart';

class GetAllFavoriteMovies {
  final FavoriteMovieRepository repository;

  GetAllFavoriteMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getFavoriteMovies();
  }
}
