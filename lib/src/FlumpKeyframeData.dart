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

  _FlumpKeyframeData(Map json) :
    this.index = _ensureInt(json["index"]),
    this.duration = _ensureInt(json["duration"]),
    this.ref = json.containsKey("ref") ? _ensureString(json["ref"]) : null,
    this.label = json.containsKey("label") ? _ensureString(json["label"]) : null,
    this.x = json.containsKey("loc") ? _ensureNum(json["loc"][0]) : 0.0,
    this.y = json.containsKey("loc") ? _ensureNum(json["loc"][1]) : 0.0,
    this.scaleX = json.containsKey("scale") ? _ensureNum(json["scale"][0]) : 1.0,
    this.scaleY = json.containsKey("scale") ? _ensureNum(json["scale"][1]) : 1.0,
    this.skewX = json.containsKey("skew") ? _ensureNum(json["skew"][0]) : 0.0,
    this.skewY = json.containsKey("skew") ? _ensureNum(json["skew"][1]) : 0.0,
    this.pivotX = json.containsKey("pivot") ? _ensureNum(json["pivot"][0]) : 0.0,
    this.pivotY = json.containsKey("pivot") ? _ensureNum(json["pivot"][1]) : 0.0,
    this.visible = json.containsKey("visible") ? _ensureBool(json["visible"]) : true,
    this.alpha = json.containsKey("alpha") ? _ensureNum(json["alpha"]) : 1.0,
    this.tweened = json.containsKey("tweened") ? _ensureBool(json["tweened"]) : true,
    this.ease = json.containsKey("ease") ? _ensureNum(json["ease"]) : 0.0;

}