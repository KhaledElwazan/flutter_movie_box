import 'package:dartz/dartz.dart';
import 'package:flutter_movie_box/core/error/failure.dart';
import 'package:flutter_movie_box/features/movies/domain/repositories/favorite_movies_repository.dart';

class IsFavoriteMovie {
  final FavoriteMovieRepository repository;

  IsFavoriteMovie(this.repository);

  Future<Either<Failure, bool>> call(int movieId) async {
    return await repository.isFavoriteMovie(movieId);
  }
}
