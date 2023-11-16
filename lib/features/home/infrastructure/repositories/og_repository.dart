import 'package:ndt_app/features/home/domain/domain.dart';

class OGRepository extends EndRepository {
  final EndDataSource dataSource;

  OGRepository({required this.dataSource});

  @override
  Future<List<Content>> getContent() async {
    return await dataSource.getContent();
  }
}
