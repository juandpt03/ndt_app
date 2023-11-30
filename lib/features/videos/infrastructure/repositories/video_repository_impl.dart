import 'package:ndt_app/features/videos/domain/domain.dart';

class VideoRepositoryImpl extends VideoRepository {
  final VideoDataSource videoDataSource;

  VideoRepositoryImpl({
    required this.videoDataSource,
  });

  @override
  Future<List<Video>> getVideos() {
    return videoDataSource.getVideos();
  }
}
