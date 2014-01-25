library stagexl_flump;

import 'dart:async';
import 'dart:convert';
import 'dart:math' hide Point, Rectangle;
import 'dart:html' show ImageElement, HttpRequest;
import 'package:stagexl/stagexl.dart';

// Flump converts Flash keyframe animations into texture atlases and JSON.
// http://threerings.github.com/flump/

part 'src/FlumpLibrary.dart';
part 'src/FlumpMovie.dart';
part 'src/FlumpMovieData.dart';
part 'src/FlumpMovieLayer.dart';
part 'src/FlumpTexture.dart';
part 'src/FlumpTextureGroup.dart';
part 'src/FlumpTextureGroupAtlas.dart';
part 'src/FlumpKeyframeData.dart';
part 'src/FlumpLayerData.dart';


bool _ensureBool(bool value) {
  if (value is bool) {
    return value;
  } else {
    throw new ArgumentError("The supplied value ($value) is not a bool.");
  }
}

int _ensureInt(int value) {
  if (value is int) {
    return value;
  } else {
    throw new ArgumentError("The supplied value ($value) is not an int.");
  }
}

num _ensureNum(num value) {
  if (value is num) {
    return value;
  } else {
    throw new ArgumentError("The supplied value ($value) is not a number.");
  }
}

String _ensureString(String value) {
  if (value is String) {
    return value;
  } else {
    throw new ArgumentError("The supplied value ($value) is not a string.");
  }
}
