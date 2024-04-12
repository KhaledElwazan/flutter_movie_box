import 'package:dartz/dartz.dart';
import 'package:flutter_movie_box/core/error/failure.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/movie.dart';
import 'package:flutter_movie_box/features/movies/domain/repositories/movies_repository.dart';

class GetMovieDetails {
  final MovieRepository repository;

  GetMovieDetails({required this.repository});

  Future<Either<Failure, Movie>> call({required int movieId}) async {
    return await repository.getMovieDetails(movieId);
  }
}
