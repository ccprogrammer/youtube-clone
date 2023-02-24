import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';

class CustomFlickControls extends StatelessWidget {
  const CustomFlickControls(
      {Key? key,
      this.iconSize = 20,
      this.fontSize = 12,
      required this.flickVideoManager})
      : super(key: key);
  final double iconSize;
  final double fontSize;
  final FlickVideoManager flickVideoManager;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // background overlay
        Positioned.fill(
          child: FlickAutoHideChild(
            child: Container(color: Colors.black38),
          ),
        ),

        // middle button
        Positioned.fill(
          child: FlickShowControlsAction(
            child: FlickSeekVideoAction(
              child: Center(
                child: flickVideoManager.nextVideoAutoPlayTimer != null
                    ? FlickAutoPlayCircularProgress(
                        colors: FlickAutoPlayTimerProgressColors(
                          backgroundColor: Colors.white30,
                          color: Colors.red,
                        ),
                      )
                    : FlickAutoHideChild(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: GestureDetector(
                            //     onTap: () {
                            //       dataManager!.skipToPreviousVideo();
                            //     },
                            //     child: Icon(
                            //       Icons.skip_previous,
                            //       color: dataManager!.hasPreviousVideo()
                            //           ? Colors.white
                            //           : Colors.white38,
                            //       size: 35,
                            //     ),
                            //   ),
                            // ),

                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FlickPlayToggle(
                                size: 50,
                              ),
                            ),

                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: GestureDetector(
                            //     onTap: () {
                            //       dataManager!.skipToNextVideo();
                            //     },
                            //     child: Icon(
                            //       Icons.skip_next,
                            //       color: dataManager!.hasNextVideo()
                            //           ? Colors.white
                            //           : Colors.white38,
                            //       size: 35,
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ),
              ),
            ),
          ),
        ),

        // bottom controls
        Positioned.fill(
          child: FlickAutoHideChild(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          FlickCurrentPosition(
                            fontSize: fontSize,
                          ),
                          Text(
                            ' / ',
                            style: TextStyle(
                                color: Colors.white, fontSize: fontSize),
                          ),
                          FlickTotalDuration(
                            fontSize: fontSize,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      FlickFullScreenToggle(
                        size: iconSize,
                      ),
                    ],
                  ),
                  FlickVideoProgressBar(
                    flickProgressBarSettings: FlickProgressBarSettings(
                      height: 5,
                      handleRadius: 5,
                      curveRadius: 50,
                      backgroundColor: Colors.white24,
                      bufferedColor: Colors.white38,
                      playedColor: Colors.red,
                      handleColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
