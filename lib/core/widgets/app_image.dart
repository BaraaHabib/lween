import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/widgets/waiting_widget.dart';

import '../resources/constants.dart';

class AppImage extends StatelessWidget {
  final String path;
  final ImageType type;
  final BoxFit fit;
  Widget? errorWidget;
  Widget? loadingWidget;
  final BorderRadiusGeometry borderRadius;
  final Border? border;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final EdgeInsets? margin;
  final String? errorImage;

  AppImage({
    super.key,
    required this.path,
    required this.type,
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
  }) {
    errorWidget ??= Image.asset(
      errorImage ?? Assets.logoPNG,
    );
    loadingWidget ??= Center(
      child: Shimmer(
        period: shimmerDuration,
        gradient: shimmerGradient,
        direction: shimmerDirection,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Styles.colorPrimary, borderRadius: borderRadius),
          // child: Image.asset(AppAssets.logo,scale: 1.5,),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: border,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Builder(
          builder: (context) {
            switch (type) {
              case ImageType.cachedNetwork:
                if (path.split('.').lastOrNull?.contains('svg') ?? false) {
                  return SvgPicture.network(
                    path,
                    // errorBuilder: (context, _, i) => errorWidget!,
                    // loadingBuilder: (BuildContext context, Widget child,
                    //     ImageChunkEvent? loadingProgress) {
                    //   if (loadingProgress == null) return child;
                    //   return loadingWidget ?? const WaitingWidget();
                    // },
                    fit: BoxFit.contain,
                  );
                }
                return CachedNetworkImage(
                  imageUrl: path,
                  fit: fit,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      loadingWidget ?? const WaitingWidget(),
                  errorWidget: (context, _, i) => errorWidget!,
                );
              case ImageType.network:
                if (path.split('.').lastOrNull?.contains('svg') ?? false) {
                  return SvgPicture.network(
                    path,
                    // color: Colors.re,
                    // errorBuilder: (context, _, i) => errorWidget!,
                    // loadingBuilder: (BuildContext context, Widget child,
                    //     ImageChunkEvent? loadingProgress) {
                    //   if (loadingProgress == null) return child;
                    //   return loadingWidget ?? const WaitingWidget();
                    // },
                    fit: BoxFit.contain,
                  );
                }
                return Image.network(
                  path,
                  errorBuilder: (context, _, i) => errorWidget!,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return loadingWidget ?? const WaitingWidget();
                  },
                  fit: fit,
                );
              case ImageType.asset:
                if (path.split('.').lastOrNull?.contains('svg') ?? false) {
                  return SvgPicture.asset(
                    path,
                    placeholderBuilder: (ctx) => loadingWidget!,
                    // errorBuilder: (context, _, i) => errorWidget!,
                    fit: fit,
                  );
                } else {
                  return Image.asset(
                    path,
                    errorBuilder: (context, _, i) => errorWidget!,
                    fit: fit,
                  );
                }
              case ImageType.file:
                return Image.file(
                  File(path),
                  fit: fit,
                  errorBuilder: (context, _, i) => errorWidget!,
                );
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

enum ImageType { network, file, cachedNetwork, asset }
