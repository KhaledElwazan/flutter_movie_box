import 'package:dartz/dartz.dart';
import 'package:flutter_movie_box/core/error/failure.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/brief_movie.dart';
import 'package:flutter_movie_box/features/movies/domain/repositories/movies_repository.dart';

class GetMovies {
  final MovieRepository repository;

  GetMovies(this.repository);

  Future<Either<Failure, List<BriefMovie>>> call(
      {MovieCategory category = MovieCategory.popular}) async {
    switch (category) {
      case MovieCategory.popular:
        return await repository.getPopularMovies();
      case MovieCategory.topRated:
        return await repository.getTopRatedMovies();
      case MovieCategory.nowPlaying:
        return await repository.getNowPlayingMovies();
      case MovieCategory.upcoming:
        return await repository.getUpcomingMovies();
    }
  }
}

enum MovieCategory {
  popular,
  topRated,
  nowPlaying,
  upcoming,
}
