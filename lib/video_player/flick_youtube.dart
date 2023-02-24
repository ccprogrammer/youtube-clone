import 'dart:developer';

import 'package:direct_link/direct_link.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/video_player/custom_flick_controls.dart';

class FlickYoutube extends StatefulWidget {
  const FlickYoutube({Key? key, required this.data, required this.flickManager}) : super(key: key);
  final FlickManager flickManager;
  final dynamic data;

  @override
  State<FlickYoutube> createState() => _FlickYoutubeState();
}

class _FlickYoutubeState extends State<FlickYoutube> {

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: widget.flickManager == null
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
              flickManager: widget.flickManager,
              flickVideoWithControls: FlickVideoWithControls(
                controls: CustomFlickControls(
                    flickVideoManager: widget.flickManager.flickVideoManager!),
              ),
              flickVideoWithControlsFullscreen: FlickVideoWithControls(
                videoFit: BoxFit.fitWidth,
                controls: CustomFlickControls(
                    flickVideoManager: widget.flickManager.flickVideoManager!),
              ),
            ),
    );
  }
}
