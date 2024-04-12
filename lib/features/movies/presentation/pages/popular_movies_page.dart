import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_box/features/movies/domain/usecases/get_movies.dart';
import 'package:flutter_movie_box/features/movies/presentation/blocs/movies/brief_movie_bloc.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/favorite_movies_page.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/now_playing_page.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/top_rated_page.dart';
import 'package:flutter_movie_box/features/movies/presentation/pages/upcoming_page.dart';
import 'package:flutter_movie_box/features/movies/presentation/widgets/movie_card.dart';
import 'package:flutter_movie_box/injection_container.dart';

class PopularMoviesPage extends StatefulWidget {
  static const String routeName = '/';
  const PopularMoviesPage({super.key});

  @override
  State<PopularMoviesPage> createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('Upcoming Movies'),
              onTap: () {
                Navigator.of(context).pushNamed(UpcomingPage.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Top Rated Movies'),
              onTap: () {
                Navigator.of(context).pushNamed(TopRatedPage.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.play_arrow),
              title: const Text('Now Playing Movies'),
              onTap: () {
                Navigator.of(context).pushNamed(NowPlayingPage.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorite Movies'),
              onTap: () {
                Navigator.of(context).pushNamed(FavoriteMoviesPage.routeName);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Popular Movies'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => MovieBloc(getMovies: sl())
          ..add(const GetMoviesEvent(category: MovieCategory.popular)),
        child: _bodyWidget(),
      ),
    );
  }

  Widget _bodyWidget() {
    return BlocBuilder<MovieBloc, MovieState>(builder: (_, state) {
      if (state is LoadingMovies) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is LoadedMovies) {
        return ListView.builder(
          itemCount: state.movies.length,
          itemBuilder: (_, index) => MovieCard(movie: state.movies[index]),
        );
      } else if (state is ErrorLoadingMovies) {
        return Center(
          child: Text(state.message),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
