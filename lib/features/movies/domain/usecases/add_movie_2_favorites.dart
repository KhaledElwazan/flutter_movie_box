import 'package:dartz/dartz.dart';
import 'package:flutter_movie_box/core/error/failure.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/movie.dart';
import 'package:flutter_movie_box/features/movies/domain/repositories/favorite_movies_repository.dart';

class AddMovie2Favorites {
  final FavoriteMovieRepository repository;

  AddMovie2Favorites({required this.repository});

  Future<Either<Failure, Unit>> call(Movie movie) async {
    return await repository.addFavoriteMovie(movie);
  }
}
