part of 'add_remove_favorite_movies_bloc.dart';

sealed class AddRemoveFavoriteMoviesState extends Equatable {
  const AddRemoveFavoriteMoviesState();

  @override
  List<Object> get props => [];
}

final class AddRemoveFavoriteMoviesInitial
    extends AddRemoveFavoriteMoviesState {}

final class AddFavoriteMovieInProgress extends AddRemoveFavoriteMoviesState {}

final class AddFavoriteMovieSuccess extends AddRemoveFavoriteMoviesState {}

final class AddFavoriteMovieFailure extends AddRemoveFavoriteMoviesState {
  final String message;

  const AddFavoriteMovieFailure({required this.message});

  @override
  List<Object> get props => [message];
}

final class RemoveFavoriteMovieInProgress
    extends AddRemoveFavoriteMoviesState {}

final class RemoveFavoriteMovieSuccess extends AddRemoveFavoriteMoviesState {}

final class RemoveFavoriteMovieFailure extends AddRemoveFavoriteMoviesState {
  final String message;

  const RemoveFavoriteMovieFailure({required this.message});

  @override
  List<Object> get props => [message];
}
