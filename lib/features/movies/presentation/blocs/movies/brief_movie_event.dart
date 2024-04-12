part of 'brief_movie_bloc.dart';

sealed class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class GetMoviesEvent extends MovieEvent {
  final MovieCategory category;

  const GetMoviesEvent({this.category = MovieCategory.popular});

  @override
  List<Object> get props => [category];
}

class RefreshMoviesEvent extends MovieEvent {
  final MovieCategory category;

  const RefreshMoviesEvent({this.category = MovieCategory.popular});

  @override
  List<Object> get props => [category];
}
