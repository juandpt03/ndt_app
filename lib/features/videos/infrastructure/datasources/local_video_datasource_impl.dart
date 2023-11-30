import 'package:ndt_app/features/videos/domain/domain.dart';

class LocalVideoDataSourceImpl extends VideoDataSource {
  @override
  Future<List<Video>> getVideos() async {
    final List<Video> videos = <Video>[
      Video(
        name: 'Conexión y verificación de módulos de Ondas Guiadas',
        path: 'https://youtu.be/hh4G1rPoeFA?si=d-HCVh8ph2mHxqUy',
      ),
      Video(
        name: 'Ondas guiadas: Inspección de tuberías con diámetro pequeño',
        path: 'https://youtu.be/tpXmEnFvVYc?si=Gn4ViiOMSyn_nTA9',
      ),
      Video(
        name: 'Ondas guiadas: Inspección de tuberías con diámetro grande',
        path: 'https://youtu.be/6olnl2B_WIw?si=LPOXKksBznLNNkQi',
      ),
      Video(
        name: 'Afectaciones de la vibración en la técnica de ondas guiadas',
        path: 'https://youtu.be/HY9sPxBAhqM?si=Cm4LcaCc0kBm28sM',
      ),
      Video(
        name: 'Desarrollos tecnológicos en la técnica de ondas guiadas',
        path: 'https://youtu.be/lSfsDTvzbJs?si=6UPOGNBoO3Rl78e5',
      ),
      Video(
        name: 'Simulación de inspección de tuberías con ondas guiadas',
        path: 'https://youtu.be/txc7ZkOpSSA?si=3SsjinyS3Y56sqHQ',
      ),
      Video(
        name:
            'Inspección por Ondas Guiadas en la integridad de ductos y otros equipos',
        path: 'https://youtu.be/XpsoWsSeZS0?si=xE4A0l2ItngLI8z1',
      ),
      Video(
        name: 'Introduction to Guided Wave Inspection Theory and Technology',
        path: 'https://youtu.be/1b_4b5IX3hk?si=GVVPc_nnq7HWBKLk',
      ),
      Video(
        name: 'The Next Generation of Guided Wave Testing',
        path: 'https://youtu.be/aChKitxtwkQ?si=uR2vXQMbP4zm4xZF',
      ),
      Video(
        name: 'Guided Wave Ultrasonic Inspections - GUL',
        path: 'https://youtu.be/MJ6IjGfvzPM?si=4gnxENXvq5pYoikg',
      ),
      Video(
        name: 'How to inspect Underwater Pipelines Using Guided Wave Testing',
        path: 'https://youtu.be/ahibqeFGah0?si=4k7uxeYx_CTkeyNJ',
      ),
      Video(
        name: 'How to do Guided Wave Testing of Pipelines',
        path: 'https://youtu.be/mDFhwXdL7CQ?si=nCybymW-7v0O-548',
      ),
    ];

    return await Future<List<Video>>.value(videos);
  }
}
