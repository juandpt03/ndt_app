import 'package:ndt_app/features/home/domain/domain.dart';
import 'package:ndt_app/features/shared/infrastructure/services/local_data/og_local_data.dart';

class OGDatasource extends EndDataSource {
  @override
  Future<List<Content>> getContent() async {
    return ogLocalData;
  }
}
