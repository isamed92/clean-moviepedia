import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviepidea/presentation/providers/providers.dart';
import 'package:moviepidea/presentation/widgets/widgets.dart';

final similarMoviesProvider = FutureProvider.family((ref, int movie) {
  final movieRepository = ref.watch(movieRepositoryProvider);

  return movieRepository.similarMovies(id: movie);
});

class SimilarMovies extends ConsumerWidget {
  final int movieId;
  const SimilarMovies(this.movieId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final similarFuture = ref.watch(similarMoviesProvider(movieId));
    return similarFuture.when(
      data: (similarMovies) => Container(
        margin: const EdgeInsets.only(bottom: 50),
        child: MovieHorizontalListView(
          movies: similarMovies,
          title: 'Recomendaciones',
          subtitle: '',
        ),
      ),
      error: (_, __) => const Center(
        child: Text('No se pudo cargar la pelicula'),
      ),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
