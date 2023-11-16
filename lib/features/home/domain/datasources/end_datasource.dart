import 'package:ndt_app/features/home/domain/domain.dart';

abstract class EndDataSource {
  Future<List<Content>> getContent();
}
