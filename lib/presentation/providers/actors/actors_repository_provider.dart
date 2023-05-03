import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviepidea/infrastructure/datasources_implementations/actor_moviedb_datasource.dart';
import 'package:moviepidea/infrastructure/repositories_implementation/actor_repository_impl.dart';

// this repository is inmutable
final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImplementation(ActorMovieDbDatasource());
});
