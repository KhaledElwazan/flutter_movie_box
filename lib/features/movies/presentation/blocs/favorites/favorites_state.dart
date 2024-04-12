part of 'favorites_bloc.dart';

sealed class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesLoaded extends FavoritesState {
  final List<Movie> movies;

  const FavoritesLoaded({required this.movies});

  @override
  List<Object> get props => [movies];
}

final class FavoritesError extends FavoritesState {
  final String message;

  const FavoritesError({required this.message});

  @override
  List<Object> get props => [message];
}

final class ClearingFavoritesState extends FavoritesState {}

final class ClearedFavoritesState extends FavoritesState {}
