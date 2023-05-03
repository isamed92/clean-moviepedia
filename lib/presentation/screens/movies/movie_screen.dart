import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviepidea/domain/entities/movie.dart';
import 'package:moviepidea/presentation/providers/movies/movie_info_provider.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const name = 'movie';
  final String movieId;
  const MovieScreen({super.key, required this.movieId});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ref.watch(movieInfoProvider)[widget.movieId];

    if (movie == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [_CustomSliverAppBar(movie: movie)],
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final Movie movie;
  const _CustomSliverAppBar({required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
          background: Stack(children: [
            SizedBox.expand(
              child: Image.network(movie.posterPath, fit: BoxFit.cover),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black45,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.7, 1.0]))),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.black45,
                            Colors.transparent,
                          ],
                          begin: Alignment.topLeft,
                          stops: [0.0, 0.4]))),
            ),
          ]),
          titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          title: Text(
            movie.title,
            style: const TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.start,
          )),
    );
  }
}
