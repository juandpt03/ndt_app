import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ndt_app/features/home/domain/domain.dart';
import 'package:ndt_app/features/home/infrastructure/datasources/og_datasource.dart';
import 'package:ndt_app/features/home/infrastructure/repositories/og_repository.dart';

final dataRepositoryProvider = StateProvider<EndRepository>((ref) {
  return OGRepository(dataSource: OGDatasource());
});
