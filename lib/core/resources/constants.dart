import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../generated/l10n.dart';

part 'enums.dart';

// api requests types
/// type of request : [RequestType.POST] or [RequestType.GET]
enum RequestType { GET, POST, PUT, DELETE }

// api requests types
enum ParametersType { Body, Url }

enum AttachmentFileType { none, image, pdf, doc, docx, video }

enum QuestionType { singleChoice, multiChoice, text, paragraph, signature }

const shimmerDuration = Duration(milliseconds: 1000);

const shimmerGradient = LinearGradient(
  colors: [
    Color(0xFF26262C),
    Color(0xFF443737),
    Color(0xFF303036),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

const shimmerDirection = ShimmerDirection.ltr;
