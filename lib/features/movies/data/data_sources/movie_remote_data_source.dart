import 'package:dio/dio.dart';
import 'package:flutter_movie_box/core/constants/base_urls.dart';
import 'package:flutter_movie_box/core/error/exceptions.dart';
import 'package:flutter_movie_box/features/movies/data/models/brief_movie_model/brief_movie_model.dart';
import 'package:flutter_movie_box/features/movies/data/models/movie_model/movie_model.dart';
import 'package:flutter_movie_box/features/movies/domain/usecases/get_movies.dart';

abstract class MovieRemoteDataSource {
  Future<List<BriefMovieModel>> getMovies(
      {MovieCategory category = MovieCategory.popular});

  Future<MovieModel> getMovieDetails(int movieId);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<BriefMovieModel>> getMovies(
      {MovieCategory category = MovieCategory.popular}) async {
    final response = await dio.get(
      '$BASE_URL/${enum2String(category)}?api_key=$API_KEY',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      final responseBody = response.data as Map<String, dynamic>;

      final List decodedJson = responseBody['results'] as List;
      final List<BriefMovieModel> movies =
          decodedJson.map((movie) => BriefMovieModel.fromJson(movie)).toList();
      return movies;
    } else {
      throw ServerException();
    }
  }

  String enum2String(MovieCategory category) {
    switch (category) {
      case MovieCategory.popular:
        return 'popular';
      case MovieCategory.topRated:
        return 'top_rated';
      case MovieCategory.nowPlaying:
        return 'now_playing';
      case MovieCategory.upcoming:
        return 'upcoming';
    }
  }

  @override
  Future<MovieModel> getMovieDetails(int movieId) async {
    final response = await dio.get('$BASE_URL/$movieId?api_key=$API_KEY',
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));

    if (response.statusCode == 200) {
      final responseBody = response.data as Map<String, dynamic>;
      return MovieModel.fromJson(responseBody);
    } else {
      throw ServerException();
    }
  }
}
