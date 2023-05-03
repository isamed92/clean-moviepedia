import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviepidea/presentation/providers/providers.dart';
import 'package:moviepidea/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const name = 'home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: _HomeView(), bottomNavigationBar: CustomBottomNavigationBar());
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideshowMovies = ref.watch(moviesSlideShowProvider);

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(title: CustomAppBar()),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            // const CustomAppBar(),
            MoviesSlideShow(movies: slideshowMovies),
            MovieHorizontalListView(
              loadNextPage: () =>
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
              movies: nowPlayingMovies,
              title: 'En cines',
              subtitle: 'Lunes 20',
            ),
            MovieHorizontalListView(
              loadNextPage: () =>
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
              movies: nowPlayingMovies,
              title: 'Proximamente',
              subtitle: 'Este mes',
            ),
            MovieHorizontalListView(
              loadNextPage: () =>
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
              movies: nowPlayingMovies,
              title: 'Populares',
              subtitle: '',
            ),
            MovieHorizontalListView(
              loadNextPage: () =>
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
              movies: nowPlayingMovies,
              title: 'Mejor calificadas',
              subtitle: 'de todos los tiempos',
            ),
            const SizedBox(
              height: 10,
            )
          ],
        );
      }, childCount: 1))
    ]);
  }
}
