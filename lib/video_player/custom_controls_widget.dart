// import 'dart:async';
// import 'dart:developer';

// import 'package:better_player/better_player.dart';
// import 'package:flutter/material.dart';
// import 'package:tvri/PORTRAIT/themes/my_themes.dart';

// class CustomControlsWidget extends StatefulWidget {
//   final BetterPlayerController? controller;
//   final Function(bool visbility)? onControlsVisibilityChanged;

//   const CustomControlsWidget({
//     Key? key,
//     this.controller,
//     this.onControlsVisibilityChanged,
//   }) : super(key: key);

//   @override
//   State<CustomControlsWidget> createState() => _CustomControlsWidgetState();
// }

// class _CustomControlsWidgetState extends State<CustomControlsWidget> {
//   bool showControls = true;

//   Timer? _debounce;

//   hideControls() {
//     if (widget.controller!.isPlaying()!) {
//       setState(() {
//         showControls = !showControls;
//       });
//       if (showControls) {
//         if (_debounce?.isActive ?? false) _debounce!.cancel();
//         _debounce = Timer(const Duration(milliseconds: 2000), () {
//           if (widget.controller!.isPlaying()!) {
//             setState(() {
//               showControls = false;
//             });
//           }
//         });
//       }
//     }

//     log('show');
//     return;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         hideControls();
//       },
//       child: Container(
//         color: Colors.transparent,
//         child: Visibility(
//           visible: showControls,
//           child: Stack(
//             children: [
//               buildTitle(),
//               buildFullScreen(),
//               buildPlayButton(),
//               buildProgressBar(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildTitle() {
//     return Align(
//       alignment: Alignment.topCenter,
//       child: Container(
//         margin: const EdgeInsets.only(top: 8),
//         child: Column(
//           children: const [
//             Text(
//               'Dialog Indonesia Berbicara, Ep 1',
//               style: TextStyle(
//                 color: MyThemes.colorWhite,
//                 fontWeight: MyThemes.medium,
//               ),
//             ),
//             SizedBox(height: 4),
//             Text(
//               'Lemahnya Petahanan Militer Indonesia',
//               style: TextStyle(
//                 color: MyThemes.colorWhite,
//                 fontWeight: MyThemes.light,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildFullScreen() {
//     return Align(
//       alignment: Alignment.topRight,
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(50),
//           onTap: () => setState(() {
//             if (widget.controller!.isFullScreen) {
//               widget.controller!.exitFullScreen();
//             } else {
//               widget.controller!.enterFullScreen();
//             }
//           }),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Icon(
//               widget.controller!.isFullScreen
//                   ? Icons.fullscreen_exit
//                   : Icons.fullscreen,
//               color: Colors.white,
//               size: 24,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildPlayButton() {
//     bool isPlaying = widget.controller!.isPlaying()!;
//     BetterPlayerController controller = widget.controller!;

//     return Center(
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // video backward
//           GestureDetector(
//             onTap: () async {
//               Duration? videoDuration =
//                   await controller.videoPlayerController!.position;
//               setState(() {
//                 if (controller.isPlaying()!) {
//                   Duration rewindDuration =
//                       Duration(seconds: (videoDuration!.inSeconds - 10));
//                   if (rewindDuration <
//                       controller.videoPlayerController!.value.duration!) {
//                     controller.seekTo(const Duration(seconds: 0));
//                   } else {
//                     controller.seekTo(rewindDuration);
//                   }
//                 }
//               });
//             },
//             child: Image.asset(
//               'assets/icons/video-player/icon-video-backward.png',
//               width: 36,
//             ),
//           ),

//           // video play/pause
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 48),
//             child: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   isPlaying ? controller.pause() : controller.play();
//                   hideControls();
//                 });
//               },
//               child: Image.asset(
//                 isPlaying
//                     ? 'assets/icons/video-player/icon-video-pause.png'
//                     : 'assets/icons/video-player/icon-video-play.png',
//                 width: 46,
//               ),
//             ),
//           ),

//           // video forward
//           GestureDetector(
//             onTap: () async {
//               Duration? videoDuration =
//                   await controller.videoPlayerController!.position;
//               setState(() {
//                 if (controller.isPlaying()!) {
//                   Duration forwardDuration =
//                       Duration(seconds: (videoDuration!.inSeconds + 10));
//                   if (forwardDuration >
//                       controller.videoPlayerController!.value.duration!) {
//                     controller.seekTo(const Duration(seconds: 0));
//                     controller.pause();
//                   } else {
//                     controller.seekTo(forwardDuration);
//                   }
//                 }
//               });
//             },
//             child: Image.asset(
//               'assets/icons/video-player/icon-video-forward.png',
//               width: 36,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildProgressBar() {
//     return Positioned(
//       bottom: 24,
//       left: 0,
//       right: 0,
//       child: SliderTheme(
//         data: SliderTheme.of(context).copyWith(
//           trackHeight: 4,
//           thumbShape: const RoundSliderThumbShape(
//             enabledThumbRadius: 4.0,
//             disabledThumbRadius: 12,
//           ),
//         ),
//         child: Slider(
//           value: 20.0,
//           max: 100.0,
//           min: 0.0,
//           activeColor: MyThemes.colorBlue,
//           inactiveColor: MyThemes.colorWhite,
//           thumbColor: MyThemes.colorDarkBlue,
//           onChanged: (double value) {},
//         ),
//       ),
//     );
//   }
// }
