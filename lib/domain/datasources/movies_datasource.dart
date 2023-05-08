import 'package:moviepidea/domain/entities/movie.dart';

abstract class MovieDatasource {
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getUpcoming({int page = 1});
  Future<List<Movie>> getTopRated({int page = 1});
  Future<Movie> getMovieById(String id);
  Future<List<Movie>> searchMovies(String query);
  Future<List<Movie>> similarMovies({required int id, int page = 1});
  Future<List<String>> getYoutubeVideosById(int id);
}
