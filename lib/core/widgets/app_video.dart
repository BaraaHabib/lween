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
        customVideoPlayerSettings: CustomVideoPlayerSettings(
          showDurationPlayed: false,
          showDurationRemaining: false,
          showPlayButton: false,
          alwaysShowThumbnailOnVideoPaused: false,
          playbackSpeedButtonAvailable: false,
          customAspectRatio: (widget.width ?? 1 ) / (widget.height ?? 1),
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
    return AbsorbPointer(
      absorbing: true,
      child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: videoPlayerController.value.isInitialized ?
          AspectRatio(
            aspectRatio: _customVideoPlayerController.videoPlayerController.value.aspectRatio,
            child: CustomVideoPlayer(
              customVideoPlayerController: _customVideoPlayerController,
            ),
          ) : widget.loadingWidget ??
              const WaitingWidget(type: WaitingWidgetType.pulse,)
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
