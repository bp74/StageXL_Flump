library stagexl_flump;

import 'dart:async';
import 'dart:math';
import 'dart:json' as json;
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
part 'src/FlumpKeyframeData.dart';
part 'src/FlumpLayerData.dart';