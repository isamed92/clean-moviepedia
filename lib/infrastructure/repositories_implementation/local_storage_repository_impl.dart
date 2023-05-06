import 'package:moviepidea/domain/datasources/local_storage_datasource.dart';
import 'package:moviepidea/domain/entities/movie.dart';
import 'package:moviepidea/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImplementation extends LocalStorageRepository {
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImplementation({required this.datasource});
  @override
  Future<bool> isMovieFavourite(int movieId) {
    return datasource.isMovieFavourite(movieId);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0}) {
    return datasource.loadMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavourite(Movie movie) {
    return datasource.toggleFavourite(movie);
  }
}
