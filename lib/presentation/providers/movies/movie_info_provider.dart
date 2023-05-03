import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviepidea/domain/entities/movie.dart';
import 'package:moviepidea/presentation/providers/providers.dart';

final movieInfoProvider =
    StateNotifierProvider<MovieMapNotifier, dynamic>((ref) {
  final getMovieById = ref.watch(movieRepositoryProvider).getMovieById;
  return MovieMapNotifier(getMovie: getMovieById);
});

typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovie;
  MovieMapNotifier({required this.getMovie}) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;
    print('realizando peticion http');
    final movie = await getMovie(movieId);
    state = {...state, movieId: movie};
  }
}
