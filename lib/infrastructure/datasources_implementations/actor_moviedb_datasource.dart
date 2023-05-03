import 'package:dio/dio.dart';
import 'package:moviepidea/config/constants/environment.dart';
import 'package:moviepidea/domain/datasources/actors_datasource.dart';
import 'package:moviepidea/domain/entities/actor.dart';
import 'package:moviepidea/infrastructure/mappers/actor_mapper.dart';
import 'package:moviepidea/infrastructure/models/moviedb/credits_response.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
  final Dio dio = Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
    'api_key': Environment.movieDBKey,
    'language': 'es-MX',
  }));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final actors = CreditsResponse.fromJson(response.data);

    return actors.cast.map((e) => ActorMapper.castToEntity(e)).toList();
  }
}
