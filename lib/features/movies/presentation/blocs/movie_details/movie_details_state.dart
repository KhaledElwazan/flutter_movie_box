part of 'movie_details_bloc.dart';

sealed class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

final class MovieDetailsInitial extends MovieDetailsState {}

class LoadingMovieDetails extends MovieDetailsState {
  final int movieId;

  const LoadingMovieDetails({required this.movieId});

  @override
  List<Object> get props => [movieId];
}

class LoadedMovieDetails extends MovieDetailsState {
  final Movie movieDetails;

  const LoadedMovieDetails({required this.movieDetails});

  @override
  List<Object> get props => [movieDetails];
}

class ErrorLoadingMovieDetails extends MovieDetailsState {
  final String message;

  const ErrorLoadingMovieDetails({required this.message});

  @override
  List<Object> get props => [message];
}
