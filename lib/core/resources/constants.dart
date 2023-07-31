import 'package:flutter/material.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:shimmer/shimmer.dart';


part 'enums.dart';

// api requests types
/// type of request : [RequestType.POST] or [RequestType.GET]
enum RequestType { GET, POST, PUT, DELETE }

// api requests types
enum ParametersType { Body, Url }

const shimmerDuration = Duration(milliseconds: 1500);

const shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFE8EFF1),
    Color(0xFFB9C8CC),
    Color(0xFFB9C8CC),
  ],
  stops: [
    0.1,
    0.3,
    0.5,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

const shimmerDirection = ShimmerDirection.ltr;


