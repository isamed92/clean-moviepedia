import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviepidea/presentation/providers/providers.dart';

import '../../../domain/entities/movie.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchedMoviesProvider =
    StateNotifierProvider<SearchedMoviesNotifier, List<Movie>>((ref) {
  final movieRepository = ref.read(movieRepositoryProvider);

  return SearchedMoviesNotifier(
      ref: ref, searchMovies: movieRepository.searchMovies);
});

typedef SearchMoviesCallback = Future<List<Movie>> Function(String q);

class SearchedMoviesNotifier extends StateNotifier<List<Movie>> {
  final SearchMoviesCallback searchMovies;
  final Ref ref;

  SearchedMoviesNotifier({required this.ref, required this.searchMovies})
      : super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);
    state = movies;
    return movies;
  }
}
