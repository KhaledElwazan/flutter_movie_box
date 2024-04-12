import 'package:dartz/dartz.dart';
import 'package:flutter_movie_box/core/error/exceptions.dart';
import 'package:flutter_movie_box/core/error/failure.dart';
import 'package:flutter_movie_box/core/network/network_info.dart';
import 'package:flutter_movie_box/features/movies/data/data_sources/movie_local_data_source.dart';
import 'package:flutter_movie_box/features/movies/data/data_sources/movie_remote_data_source.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/brief_movie.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/movie.dart';
import 'package:flutter_movie_box/features/movies/domain/repositories/movies_repository.dart';
import 'package:flutter_movie_box/features/movies/domain/usecases/get_movies.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieLocalDataSource movieLocalDataSource;
  final MovieRemoteDataSource movieRemoteDataSource;
  final NetworkInfo networkInfo;

  MovieRepositoryImpl({
    required this.movieLocalDataSource,
    required this.movieRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<BriefMovie>>> getNowPlayingMovies() {
    return process(MovieCategory.nowPlaying);
  }

  @override
  Future<Either<Failure, List<BriefMovie>>> getPopularMovies() {
    return process(MovieCategory.popular);
  }

  @override
  Future<Either<Failure, List<BriefMovie>>> getTopRatedMovies() {
    return process(MovieCategory.topRated);
  }

  @override
  Future<Either<Failure, List<BriefMovie>>> getUpcomingMovies() {
    return process(MovieCategory.upcoming);
  }

  Future<Either<Failure, List<BriefMovie>>> process(
      MovieCategory category) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteMovies =
            await movieRemoteDataSource.getMovies(category: category);
        movieLocalDataSource.cacheMovies(remoteMovies, category: category);
        return Right(remoteMovies);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localMovies =
            await movieLocalDataSource.getCachedMovies(category: category);
        return Right(localMovies);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Movie>> getMovieDetails(int movieId) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteMovie =
            await movieRemoteDataSource.getMovieDetails(movieId);
        movieLocalDataSource.cacheMovieDetails(remoteMovie);
        return Right(remoteMovie);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localMovie =
            await movieLocalDataSource.getCachedMovieDetails(movieId);
        return Right(localMovie);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
