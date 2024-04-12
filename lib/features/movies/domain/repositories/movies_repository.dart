import 'package:dartz/dartz.dart';
import 'package:flutter_movie_box/core/error/failure.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/brief_movie.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<BriefMovie>>> getPopularMovies();
  Future<Either<Failure, List<BriefMovie>>> getTopRatedMovies();
  Future<Either<Failure, List<BriefMovie>>> getNowPlayingMovies();
  Future<Either<Failure, List<BriefMovie>>> getUpcomingMovies();
  Future<Either<Failure, Movie>> getMovieDetails(int movieId);
}
