import 'package:ndt_app/features/videos/domain/domain.dart';

abstract class VideoDataSource {
  Future<List<Video>> getVideos();
}
