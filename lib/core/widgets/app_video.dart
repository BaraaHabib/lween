import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lween/core/extended/get_utils/src/extensions/export.dart';
import 'package:video_player/video_player.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/numbers_ext.dart';

class AppVideo extends StatefulWidget {
  final String path;
  // final VideoType type;
  final BoxFit fit;
  final Widget? errorWidget;
  final Widget? loadingWidget;
  final BorderRadius borderRadius;
  final Border? border;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final EdgeInsets? margin;
  final String? errorImage;

  const AppVideo({
    super.key,
    required this.path,
    // required this.type,
    this.fit = BoxFit.cover,
    this.errorWidget,
    this.borderRadius = BorderRadius.zero,
    this.loadingWidget,
    this.height,
    this.width,
    this.backgroundColor,
    this.margin,
    this.border,
    this.errorImage,
  });
  @override
  AppVideoState createState() => AppVideoState();
}

class AppVideoState extends State<AppVideo> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    if (widget.path.isURL) {
      controller = VideoPlayerController.network(
        widget.path,
      );
    } else if (widget.path.isVideoFileName) {
      controller = VideoPlayerController.file(
        File(widget.path),
      );
    } else
    // if (path.isAssets)
    {
      controller = VideoPlayerController.asset(
        widget.path,
      );
    }

    controller.addListener(() {
      setState(() {});
    });
    // _controller.setLooping(true);
    controller.initialize().then((_) => setState(() {}));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              VideoPlayer(controller),
              ControlsOverlay(controller: controller),
              SizedBox(
                height: 15.hx,
                child: VideoProgressIndicator(
                  controller,
                  allowScrubbing: true,
                  colors: const VideoProgressColors(
                    playedColor: Styles.colorPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
