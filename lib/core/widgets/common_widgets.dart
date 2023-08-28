
import 'package:flutter/material.dart';

abstract class CommonWidgets {
  static const Widget searchIcon = Hero(
    tag: 'search-icon',
    child: Icon(Icons.search,),
  );

  static final Widget expandedContainer = Expanded(child: Container());
}

