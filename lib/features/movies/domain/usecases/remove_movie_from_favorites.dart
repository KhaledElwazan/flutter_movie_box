import 'package:dartz/dartz.dart';
import 'package:flutter_movie_box/core/error/failure.dart';
import 'package:flutter_movie_box/features/movies/domain/repositories/favorite_movies_repository.dart';

class RemoveMovieFromFavorites {
  final FavoriteMovieRepository moviesRepository;

  RemoveMovieFromFavorites({required this.moviesRepository});

  Future<Either<Failure, void>> call(int movieId) async {
    return await moviesRepository.removeFavoriteMovie(movieId);
  }
}
