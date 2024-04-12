import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_box/features/movies/domain/entities/movie.dart';
import 'package:flutter_movie_box/features/movies/domain/usecases/get_movie_details.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetails getMovieDetails;

  MovieDetailsBloc({required this.getMovieDetails})
      : super(MovieDetailsInitial()) {
    on<MovieDetailsEvent>((event, emit) async {
      if (event is GetMovieDetailsEvent) {
        emit(LoadingMovieDetails(movieId: event.movieId));
        final failureOrSuccess =
            await getMovieDetails.call(movieId: event.movieId);
        failureOrSuccess.fold(
          // TODO: add proper error messages
          (failure) => emit(const ErrorLoadingMovieDetails(message: 'Error')),
          (movie) => emit(
            LoadedMovieDetails(movieDetails: movie),
          ),
        );
      }
    });
  }
}
