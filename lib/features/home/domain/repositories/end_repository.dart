import 'package:ndt_app/features/home/domain/domain.dart';

abstract class EndRepository {
  Future<List<Content>> getContent();
}
