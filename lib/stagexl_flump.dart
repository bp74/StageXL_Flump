library stagexl_flump;

import 'dart:async';
import 'dart:convert';
import 'dart:math' hide Point, Rectangle;
import 'dart:html' show ImageElement, HttpRequest;
import 'package:stagexl/stagexl.dart';

// Flump converts Flash keyframe animations into texture atlases and JSON.
// http://threerings.github.com/flump/

part 'src/flump_library.dart';
part 'src/flump_movie.dart';
part 'src/flump_movie_data.dart';
part 'src/flump_movie_layer.dart';
part 'src/flump_texture.dart';
part 'src/flump_texture_group.dart';
part 'src/flump_texture_group_atlas.dart';
part 'src/flump_keyframe_data.dart';
part 'src/flump_layer_data.dart';


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
