part of 'add_remove_favorite_movies_bloc.dart';

sealed class AddRemoveFavoriteMoviesEvent extends Equatable {
  const AddRemoveFavoriteMoviesEvent();

  @override
  List<Object> get props => [];
}

final class AddFavoriteMovieEvent extends AddRemoveFavoriteMoviesEvent {
  final Movie movie;

  const AddFavoriteMovieEvent({required this.movie});

  @override
  List<Object> get props => [movie];
}

final class RemoveFavoriteMovieEvent extends AddRemoveFavoriteMoviesEvent {
  final int movieId;

  const RemoveFavoriteMovieEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}

final class GetFavoriteMoviesEvent extends AddRemoveFavoriteMoviesEvent {}
