
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lween/core/configurations/assets.dart';

abstract class CommonWidgets {
  static const Widget searchIcon = Hero(
    tag: 'search-icon',
    child: Icon(Icons.search,),
  );

  static final Widget expandedContainer = Expanded(child: Container());
}

