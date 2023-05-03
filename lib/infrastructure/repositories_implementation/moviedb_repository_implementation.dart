import 'package:moviepidea/domain/datasources/movies_datasource.dart';
import 'package:moviepidea/domain/entities/movie.dart';
import 'package:moviepidea/domain/repositories/movies_repository.dart';

class MovieDbRepositoryImplementation extends MoviesRepository {
  final MovieDatasource datasource;

  MovieDbRepositoryImplementation(this.datasource);
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
