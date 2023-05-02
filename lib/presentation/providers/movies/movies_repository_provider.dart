import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviepidea/infrastructure/datasources_implementations/themoviedb_datasource.dart';
import 'package:moviepidea/infrastructure/repositories_implementation/moviedb_repository_implementation.dart';

// this repository is inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieDbRepositoryImplementation(TheMovideDbDatasource());
});
