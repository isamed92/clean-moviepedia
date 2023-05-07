import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviepidea/domain/entities/movie.dart';
import 'package:moviepidea/domain/repositories/local_storage_repository.dart';
import 'package:moviepidea/presentation/providers/storage/local_storage_provider.dart';

final favouritesMoviesProvider =
    StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return StorageMoviesNotifier(repository: localStorageRepository);
});

class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final LocalStorageRepository repository;
  StorageMoviesNotifier({required this.repository}) : super({});

  Future<List<Movie>> loadNextPage() async {
    final movies =
        await repository.loadMovies(offset: page * 10); //TODO limit 10

    page++;

    final tempMoviesMap = <int, Movie>{};
    for (final movie in movies) {
      tempMoviesMap[movie.id] = movie;
    }
    state = {...state, ...tempMoviesMap};

    return movies;
  }
}
