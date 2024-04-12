part of 'favorites_bloc.dart';

sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

final class GetAllFavoriteMoviesEvent extends FavoritesEvent {}

final class RefreshFavoriteMoviesEvent extends FavoritesEvent {}

final class ClearFavoritesEvent extends FavoritesEvent {}
