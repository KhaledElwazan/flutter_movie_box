import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_box/core/error/exceptions.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/movie.dart';
import 'package:flutter_movie_box/features/movies/domain/usecases/add_movie_2_favorites.dart';
import 'package:flutter_movie_box/features/movies/domain/usecases/remove_movie_from_favorites.dart';

part 'add_remove_favorite_movies_event.dart';
part 'add_remove_favorite_movies_state.dart';

class AddRemoveFavoriteMoviesBloc
    extends Bloc<AddRemoveFavoriteMoviesEvent, AddRemoveFavoriteMoviesState> {
  final AddMovie2Favorites addMovie2Favorites;
  final RemoveMovieFromFavorites removeMovieFromFavorites;

  AddRemoveFavoriteMoviesBloc(
      {required this.addMovie2Favorites,
      required this.removeMovieFromFavorites})
      : super(AddRemoveFavoriteMoviesInitial()) {
    on<AddRemoveFavoriteMoviesEvent>((event, emit) async {
      if (event is AddFavoriteMovieEvent) {
        try {
          emit(AddFavoriteMovieInProgress());
          final addedOrFailure = await addMovie2Favorites(event.movie);
          addedOrFailure.fold((failure) {
            emit(const AddFavoriteMovieFailure(message: 'Error adding movie'));
          }, (added) {
            emit(AddFavoriteMovieSuccess());
          });
        } on CacheException {
          emit(const AddFavoriteMovieFailure(message: "Cache Failure"));
        }
      } else if (event is RemoveFavoriteMovieEvent) {
        try {
          emit(RemoveFavoriteMovieInProgress());
          final removedOrFailure =
              await removeMovieFromFavorites(event.movieId);
          removedOrFailure.fold((failure) {
            emit(const RemoveFavoriteMovieFailure(
                message: 'Error removing movie'));
          }, (removed) {
            emit(RemoveFavoriteMovieSuccess());
          });
        } on CacheException {
          emit(const RemoveFavoriteMovieFailure(message: "Cache Failure"));
        }
      }
    });
  }
}
