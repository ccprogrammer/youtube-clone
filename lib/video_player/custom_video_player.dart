import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({Key? key}) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  init() {
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
        'https://user-images.githubusercontent.com/90954993/210757144-069fa35f-5131-45d5-8c10-317a44a07c57.mp4',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlickVideoPlayer(
      flickManager: flickManager,
      flickVideoWithControls: const FlickVideoWithControls(
        closedCaptionTextStyle: TextStyle(fontSize: 8),
        controls: FlickPortraitControls(),
      ),
      flickVideoWithControlsFullscreen: const FlickVideoWithControls(
        controls: FlickLandscapeControls(),
      ),
    );
  }
}
