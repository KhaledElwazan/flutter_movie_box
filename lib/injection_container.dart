import 'package:flutter_movie_box/core/network/network_info.dart';
import 'package:flutter_movie_box/features/movies/data/data_sources/favorite_movies_local_data_source.dart';
import 'package:flutter_movie_box/features/movies/data/data_sources/movie_local_data_source.dart';
import 'package:flutter_movie_box/features/movies/data/data_sources/movie_remote_data_source.dart';
import 'package:flutter_movie_box/features/movies/data/repositories/favorite_movies_repository_impl.dart';
import 'package:flutter_movie_box/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:flutter_movie_box/features/movies/domain/repositories/favorite_movies_repository.dart';
import 'package:flutter_movie_box/features/movies/domain/repositories/movies_repository.dart';
import 'package:flutter_movie_box/features/movies/domain/usecases/add_movie_2_favorites.dart';
import 'package:flutter_movie_box/features/movies/domain/usecases/clear_favorites.dart';
import 'package:flutter_movie_box/features/movies/domain/usecases/get_all_favorite_movies.dart';
import 'package:flutter_movie_box/features/movies/domain/usecases/get_movie_details.dart';
import 'package:flutter_movie_box/features/movies/domain/usecases/get_movies.dart';
import 'package:flutter_movie_box/features/movies/domain/usecases/is_favorite_movie.dart';
import 'package:flutter_movie_box/features/movies/domain/usecases/remove_movie_from_favorites.dart';
import 'package:flutter_movie_box/features/movies/presentation/blocs/add_remove_favorites/add_remove_favorite_movies_bloc.dart';
import 'package:flutter_movie_box/features/movies/presentation/blocs/favorites/favorites_bloc.dart';
import 'package:flutter_movie_box/features/movies/presentation/blocs/movie_details/movie_details_bloc.dart';
import 'package:flutter_movie_box/features/movies/presentation/blocs/movies/brief_movie_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<MovieBloc>(
    () => MovieBloc(
      getMovies: sl(),
    ),
  );

  sl.registerFactory<MovieDetailsBloc>(() => MovieDetailsBloc(
        getMovieDetails: sl(),
      ));

  sl.registerFactory<FavoritesBloc>(
    () => FavoritesBloc(
      getAllFavoriteMovies: sl(),
      isFavoriteMovie: sl(),
      clearFavorites: sl(),
    ),
  );

  sl.registerLazySingleton<ClearFavorites>(
      () => ClearFavorites(favoriteMovieRepository: sl()));

  sl.registerFactory<AddRemoveFavoriteMoviesBloc>(
    () => AddRemoveFavoriteMoviesBloc(
      addMovie2Favorites: sl(),
      removeMovieFromFavorites: sl(),
    ),
  );

  sl.registerLazySingleton<GetMovieDetails>(
      () => GetMovieDetails(repository: sl()));

  sl.registerLazySingleton<GetMovies>(() => GetMovies(sl()));

  sl.registerLazySingleton<GetAllFavoriteMovies>(
      () => GetAllFavoriteMovies(sl()));

  sl.registerLazySingleton<IsFavoriteMovie>(() => IsFavoriteMovie(sl()));

  sl.registerLazySingleton<AddMovie2Favorites>(
      () => AddMovie2Favorites(repository: sl()));

  sl.registerLazySingleton<RemoveMovieFromFavorites>(
      () => RemoveMovieFromFavorites(moviesRepository: sl()));

  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
        movieRemoteDataSource: sl(),
        movieLocalDataSource: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<FavoriteMovieRepository>(
    () => FavoriteMoviesRepositoryImpl(
      favoriteMoviesLocalDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(
            client: sl(),
          ));

  sl.registerLazySingleton<MovieLocalDataSource>(() => MovieLocalDataSourceImpl(
        sharedPreferences: sl(),
      ));

  sl.registerLazySingleton<FavoriteMoviesLocalDataSource>(
      () => FavoriteMoviesLocalDataSourceImpl(
            sharedPreferences: sl(),
          ));

  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));

  sl.registerLazySingleton<http.Client>(() => http.Client());
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
