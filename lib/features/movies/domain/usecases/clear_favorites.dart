import 'package:dartz/dartz.dart';
import 'package:flutter_movie_box/core/error/failure.dart';
import 'package:flutter_movie_box/features/movies/domain/repositories/favorite_movies_repository.dart';

class ClearFavorites {
  final FavoriteMovieRepository favoriteMovieRepository;

  ClearFavorites({required this.favoriteMovieRepository});

  Future<Either<Failure, Unit>> call() async {
    return await favoriteMovieRepository.clear();
  }
}
