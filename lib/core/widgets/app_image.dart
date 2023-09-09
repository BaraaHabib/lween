// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lween/core/extended/extensions.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/widgets/waiting_widget.dart';

import '../resources/constants.dart';

class AppImage extends StatelessWidget {
  String? path;
  final ImageType type;
  final BoxFit fit;
  Widget? errorWidget;
  Widget? loadingWidget;
  final BorderRadiusGeometry borderRadius;
  final Border? border;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? color;
  final EdgeInsets? margin;
  String? errorImage;

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
    this.color,
  }) {
    path ??= Assets.logoPNG;

    if(errorImage != null){
      if(!errorImage!.contains('svg')){
        errorWidget ??= Image.asset(
          errorImage!
        );
      }
      else{
        errorWidget ??= SvgPicture.asset(
          errorImage!
        );
      }
    }
    else{
      errorWidget ??= Image.asset(
          Assets.logoPNG
      );
    }

    loadingWidget ??= const WaitingWidget(type: WaitingWidgetType.pulse,);
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
                if (path?.split('.').lastOrNull?.contains('svg') ?? false) {
                  return SvgPicture.network(
                    path!,
                    colorFilter: color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn,),
                    fit: BoxFit.contain,
                  );
                }
                return CachedNetworkImage(
                  imageUrl: path!,
                  fit: fit,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      loadingWidget ?? const WaitingWidget(),
                  errorWidget: (context, _, i) => errorWidget!,
                  color: color,
                );
              case ImageType.network:
                if (path!.split('.').lastOrNull?.contains('svg') ?? false) {
                  return SvgPicture.network(
                    path!,
                    colorFilter: color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn,),
                    fit: BoxFit.contain,
                  );
                }
                return Image.network(
                  path!,
                  errorBuilder: (context, _, i) => errorWidget!,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return loadingWidget ?? const WaitingWidget();
                  },
                  fit: fit,
                  color: color,
                );
              case ImageType.asset:
                if (path!.split('.').lastOrNull?.contains('svg') ?? false) {
                  return SvgPicture.asset(
                    path!,
                    placeholderBuilder: (ctx) => loadingWidget!,
                    colorFilter: color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn,),
                    fit: fit,
                  );
                } else {
                  return Image.asset(
                    path!,
                    errorBuilder: (context, _, i) => errorWidget!,
                    fit: fit,
                    color: color,
                  );
                }
              case ImageType.file:
                return Image.file(
                  File(path!,),
                  fit: fit,
                  errorBuilder: (context, _, i) => errorWidget!,
                  color: color,
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
