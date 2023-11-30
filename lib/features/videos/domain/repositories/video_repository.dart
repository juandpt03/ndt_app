import 'package:ndt_app/features/videos/domain/domain.dart';

abstract class VideoRepository {
  Future<List<Video>> getVideos();
}
