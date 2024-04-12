import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_box/core/error/exceptions.dart';
import 'package:flutter_movie_box/core/error/failure.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/movie.dart';
import 'package:flutter_movie_box/features/movies/domain/usecases/clear_favorites.dart';
import 'package:flutter_movie_box/features/movies/domain/usecases/get_all_favorite_movies.dart';
import 'package:flutter_movie_box/features/movies/domain/usecases/is_favorite_movie.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetAllFavoriteMovies getAllFavoriteMovies;
  final IsFavoriteMovie isFavoriteMovie;
  final ClearFavorites clearFavorites;

  FavoritesBloc(
      {required this.getAllFavoriteMovies,
      required this.isFavoriteMovie,
      required this.clearFavorites})
      : super(FavoritesInitial()) {
    on<FavoritesEvent>((event, emit) async {
      if (event is GetAllFavoriteMoviesEvent ||
          event is RefreshFavoriteMoviesEvent) {
        emit(FavoritesLoading());
        final favoritesOrFailure = await getAllFavoriteMovies();
        favoritesOrFailure.fold((failure) {
          emit(FavoritesError(message: getErrorMessage(failure)));
        }, (favorites) {
          emit(FavoritesLoaded(movies: favorites));
        });
      } else if (event is ClearFavoritesEvent) {
        emit(ClearingFavoritesState());
        final clearOrFailure = await clearFavorites();
        clearOrFailure.fold((failure) {
          emit(FavoritesError(message: getErrorMessage(failure)));
        }, (favorites) {
          emit(ClearedFavoritesState());
        });
      }
    });
  }
  String getErrorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return "Server Failure";
      case const (CacheException):
        return "Cache Failure";
      default:
        return "Unexpected Error";
    }
  }
}
