import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:ndt_app/features/videos/presentation/providers/providers.dart';
import 'package:ndt_app/features/videos/presentation/screens/screens.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosScreen extends ConsumerWidget {
  const VideosScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return ref.watch(videProvider).when(
          data: (videos) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                leading: const SizedBox(),
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: const Text(
                  'Videos',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              body: ListView.builder(
                physics: const ClampingScrollPhysics(),
                // shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final videoId =
                      YoutubePlayer.convertUrlToId(videos[index].path);

                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 10,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      leading: const Icon(
                        FontAwesomeIcons.youtube,
                        color: Colors.red,
                      ),
                      trailing: const Icon(FontAwesomeIcons.arrowRight),
                      subtitle: Text(videos[index].name),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => FluidDialog(
                            edgePadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            rootPage: FluidDialogPage(
                              alignment: Alignment
                                  .center, //Aligns the dialog to the bottom left.
                              builder: (context) => VideoPlayer(
                                videoId: videoId!,
                              ), // This can be any widget.
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
                itemCount: videos.length,
              ),
            );
          },
          error: (error, stackTrace) => Center(
            child: Text(
              error.toString(),
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        );
  }
}
