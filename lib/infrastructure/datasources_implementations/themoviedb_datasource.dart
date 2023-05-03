import 'package:dio/dio.dart';
import 'package:moviepidea/config/constants/environment.dart';
import 'package:moviepidea/domain/datasources/movies_datasource.dart';
import 'package:moviepidea/domain/entities/movie.dart';
import 'package:moviepidea/infrastructure/mappers/movie_mapper.dart';
import 'package:moviepidea/infrastructure/models/moviedb/moviedb_response.dart';

class TheMovideDbDatasource extends MovieDatasource {
  final Dio dio = Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
    'api_key': Environment.movieDBKey,
    'language': 'es-MX',
  }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDbResponse.results
        .where((element) => element.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();
    return movies;
  }
}
