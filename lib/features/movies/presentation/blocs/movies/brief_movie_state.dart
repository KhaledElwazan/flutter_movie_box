part of 'brief_movie_bloc.dart';

sealed class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

final class MovieInitial extends MovieState {}

class LoadingMovies extends MovieState {
  final MovieCategory category;

  const LoadingMovies({required this.category});

  @override
  List<Object> get props => [category];
}

class LoadedMovies extends MovieState {
  final List<BriefMovie> movies;

  const LoadedMovies({required this.movies});

  @override
  List<Object> get props => [movies];
}

class ErrorLoadingMovies extends MovieState {
  final String message;

  const ErrorLoadingMovies({required this.message});

  @override
  List<Object> get props => [message];
}
