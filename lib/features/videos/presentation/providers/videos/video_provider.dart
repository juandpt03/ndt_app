import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ndt_app/features/videos/domain/domain.dart';
import 'package:ndt_app/features/videos/infrastructure/infrastructure.dart';

final videoRepositoryProvider = StateProvider<VideoRepository>(
  (ref) {
    return VideoRepositoryImpl(
      videoDataSource: LocalVideoDataSourceImpl(),
    );
  },
);

final videProvider = FutureProvider<List<Video>>((ref) async {
  return await ref.watch(videoRepositoryProvider).getVideos();
});
