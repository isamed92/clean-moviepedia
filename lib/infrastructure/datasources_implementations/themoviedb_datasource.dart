import 'package:dio/dio.dart';
import 'package:moviepidea/config/constants/environment.dart';
import 'package:moviepidea/domain/datasources/movies_datasource.dart';
import 'package:moviepidea/domain/entities/movie.dart';
import 'package:moviepidea/infrastructure/mappers/movie_mapper.dart';
import 'package:moviepidea/infrastructure/models/moviedb/movie_details.dart';
import 'package:moviepidea/infrastructure/models/moviedb/moviedb_response.dart';

class TheMovideDbDatasource extends MovieDatasource {
  final Dio dio = Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
    'api_key': Environment.movieDBKey,
    'language': 'es-MX',
  }));

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDbResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDbResponse.results
        .where((element) => element.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
    if (response.statusCode != 200)
      throw Exception('movie with id: $id not found');

    final movieDB = MovieDetails.fromJson(response.data);
    final movie = MovieMapper.movieDetailToEntity(movieDB);
    return movie;
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    final response =
        await dio.get('/search/movie', queryParameters: {'query': query});
    return _jsonToMovies(response.data);
  }
}
