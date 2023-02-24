import 'dart:developer';

import 'package:direct_link/direct_link.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/video_player/custom_flick_controls.dart';

class FlickYoutube extends StatefulWidget {
  const FlickYoutube({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  State<FlickYoutube> createState() => _FlickYoutubeState();
}

class _FlickYoutubeState extends State<FlickYoutube> {
  FlickManager? flickManager;
  VideoPlayerController? videoPlayerController;

  @override
  void initState() {
    super.initState();
    log('url ${widget.data['video_url']}');
    init();
  }

  @override
  void dispose() {
    flickManager!.dispose();
    super.dispose();
  }

  init() async {
    var check = await DirectLink.check(widget.data['video_url']);
    if (check == null) {
    } else {
      videoPlayerController = VideoPlayerController.network(
        check[0].link,
      )..initialize().then((value) {
          log('initialized');
          videoPlayerController!.play();
          setState(() {});
        });

      flickManager = FlickManager(
        videoPlayerController: videoPlayerController!,
      );

      log('INITALIZE flickManager');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: flickManager == null
          ? Container(
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    widget.data['thumbnail'],
                  ),
                ),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            )
          : FlickVideoPlayer(
              flickManager: flickManager!,
              flickVideoWithControls: FlickVideoWithControls(
                controls: CustomFlickControls(
                    flickVideoManager: flickManager!.flickVideoManager!),
              ),
              flickVideoWithControlsFullscreen: FlickVideoWithControls(
                videoFit: BoxFit.fitWidth,
                controls: CustomFlickControls(
                    flickVideoManager: flickManager!.flickVideoManager!),
              ),
            ),
    );
  }
}
