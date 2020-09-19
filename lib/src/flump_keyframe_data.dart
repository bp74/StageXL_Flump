part of stagexl_flump;

class _FlumpKeyframeData {
  int index;
  int duration;
  String ref;
  String label;

  num x, y;
  num scaleX, scaleY;
  num skewX, skewY;
  num pivotX, pivotY;

  bool visible;
  num alpha;

  bool tweened;
  num ease;

  _FlumpKeyframeData(Map json) {
    index = _ensureInt(json['index']);
    duration = _ensureInt(json['duration']);
    ref = json.containsKey('ref') ? _ensureString(json['ref']) : null;
    label = json.containsKey('label') ? _ensureString(json['label']) : null;
    x = json.containsKey('loc') ? _ensureNum(json['loc'][0]) : 0.0;
    y = json.containsKey('loc') ? _ensureNum(json['loc'][1]) : 0.0;
    scaleX = json.containsKey('scale') ? _ensureNum(json['scale'][0]) : 1.0;
    scaleY = json.containsKey('scale') ? _ensureNum(json['scale'][1]) : 1.0;
    skewX = json.containsKey('skew') ? _ensureNum(json['skew'][0]) : 0.0;
    skewY = json.containsKey('skew') ? _ensureNum(json['skew'][1]) : 0.0;
    pivotX = json.containsKey('pivot') ? _ensureNum(json['pivot'][0]) : 0.0;
    pivotY = json.containsKey('pivot') ? _ensureNum(json['pivot'][1]) : 0.0;
    visible = json.containsKey('visible') ? _ensureBool(json['visible']) : true;
    alpha = json.containsKey('alpha') ? _ensureNum(json['alpha']) : 1.0;
    tweened = json.containsKey('tweened') ? _ensureBool(json['tweened']) : true;
    ease = json.containsKey('ease') ? _ensureNum(json['ease']) : 0.0;
  }
}
