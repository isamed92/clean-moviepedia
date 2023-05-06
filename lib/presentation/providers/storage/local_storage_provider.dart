import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviepidea/infrastructure/datasources_implementations/isar_datasource.dart';
import 'package:moviepidea/infrastructure/repositories_implementation/local_storage_repository_impl.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImplementation(datasource: IsarDatasource());
});
