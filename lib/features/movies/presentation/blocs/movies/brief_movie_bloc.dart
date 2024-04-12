import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_box/core/error/exceptions.dart';
import 'package:flutter_movie_box/core/error/failure.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/brief_movie.dart';
import 'package:flutter_movie_box/features/movies/domain/usecases/get_movies.dart';

part 'brief_movie_event.dart';
part 'brief_movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetMovies getMovies;

  MovieBloc({required this.getMovies}) : super(MovieInitial()) {
    on<MovieEvent>((event, emit) async {
      if (event is GetMoviesEvent || event is RefreshMoviesEvent) {
        event = event as GetMoviesEvent;
        emit(LoadingMovies(category: event.category));
        final failureOrMovies = await getMovies(category: event.category);
        failureOrMovies.fold(
          (failure) => emit(
            ErrorLoadingMovies(
              message: getErrorMessage(failure),
            ),
          ),
          (movies) => emit(LoadedMovies(movies: movies)),
        );
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
