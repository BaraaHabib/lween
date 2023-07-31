import 'dart:io';

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lween/core/extended/get_utils/src/extensions/export.dart';
// import 'package:video_player/video_player.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/extended/string_ext.dart';
import 'package:lween/core/navigation/logger.dart';
import 'package:lween/core/widgets/waiting_widget.dart';

class AppVideo extends StatefulWidget {
  final String path;
  // final VideoType type;
  final BoxFit fit;
  final Widget? errorWidget;
  final Widget? loadingWidget;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final bool looping;
  const AppVideo({
    super.key,
    required this.path,
    // required this.type,
    this.fit = BoxFit.cover,
    this.looping = true,
    this.errorWidget,
    this.loadingWidget,
    this.height,
    this.width,
    this.margin,
  });
  @override
  AppVideoState createState() => AppVideoState();
}

class AppVideoState extends State<AppVideo> with AutomaticKeepAliveClientMixin{
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;
  bool isVideoFinished = false;

  @override
  void initState() {
    super.initState();
    if (widget.path.isAssets) {
      videoPlayerController =
          VideoPlayerController.asset((widget.path),);
    }
    else {
      videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(widget.path));
    }
    videoPlayerController
        .initialize()
        .then((value) {

      _customVideoPlayerController.videoPlayerController
        ..setLooping(widget.looping)
        ..setVolume(0);
      _customVideoPlayerController.videoPlayerController.play();
      setState(() {});

    });
    _customVideoPlayerController = CustomVideoPlayerController(
        context: context,
        videoPlayerController: videoPlayerController,
        customVideoPlayerSettings: const CustomVideoPlayerSettings(
          showDurationPlayed: false,
          showDurationRemaining: false,
          showPlayButton: false,
          alwaysShowThumbnailOnVideoPaused: false,
          playbackSpeedButtonAvailable: false,
          controlBarAvailable: false,
          settingsButtonAvailable: false,
          showFullscreenButton: false,
          controlsPadding: EdgeInsets.zero,
          controlBarPadding: EdgeInsets.zero,
        )
    );
  }

  @override
  void dispose() {
    // videoPlayerController.dispose();
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return IgnorePointer(
      ignoring: true,
      child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: videoPlayerController.value.isInitialized ?
          CustomVideoPlayer(
            customVideoPlayerController: _customVideoPlayerController,
          ) : widget.loadingWidget ??
              const WaitingWidget(type: WaitingWidgetType.pulse,)
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}


class ControlsOverlay extends StatelessWidget {
  const ControlsOverlay({super.key, required this.controller});


  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: const Center(
                    child: Icon(Icons.play_arrow_outlined),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        // Align(
        //   alignment: Alignment.topLeft,
        //   child: PopupMenuButton<Duration>(
        //     initialValue: controller.value.captionOffset,
        //     tooltip: 'Caption Offset',
        //     onSelected: (Duration delay) {
        //       controller.setCaptionOffset(delay);
        //     },
        //     itemBuilder: (BuildContext context) {
        //       return <PopupMenuItem<Duration>>[
        //         for (final Duration offsetDuration in _exampleCaptionOffsets)
        //           PopupMenuItem<Duration>(
        //             value: offsetDuration,
        //             child: Text('${offsetDuration.inMilliseconds}ms'),
        //           )
        //       ];
        //     },
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(
        //         // Using less vertical padding as the text is also longer
        //         // horizontally, so it feels like it would need more spacing
        //         // horizontally (matching the aspect ratio of the video).
        //         vertical: 12,
        //         horizontal: 16,
        //       ),
        //       child: Text('${controller.value.captionOffset.inMilliseconds}ms'),
        //     ),
        //   ),
        // ),
        // Align(
        //   alignment: Alignment.topRight,
        //   child: PopupMenuButton<double>(
        //     initialValue: controller.value.playbackSpeed,
        //     tooltip: 'Playback speed',
        //     onSelected: (double speed) {
        //       controller.setPlaybackSpeed(speed);
        //     },
        //     itemBuilder: (BuildContext context) {
        //       return <PopupMenuItem<double>>[
        //         for (final double speed in _examplePlaybackRates)
        //           PopupMenuItem<double>(
        //             value: speed,
        //             child: Text('${speed}x'),
        //           )
        //       ];
        //     },
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(
        //         // Using less vertical padding as the text is also longer
        //         // horizontally, so it feels like it would need more spacing
        //         // horizontally (matching the aspect ratio of the video).
        //         vertical: 12,
        //         horizontal: 16,
        //       ),
        //       child: Text('${controller.value.playbackSpeed}x',style: const TextStyle(color: Colors.white,),),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
