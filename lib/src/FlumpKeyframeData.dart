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
    this.index = json["index"];
    this.duration = json["duration"];

    this.ref = json.containsKey("ref") ? json["ref"] : null;
    this.label = json.containsKey("label") ? json["label"] : null;

    this.x = json.containsKey("loc") ? json["loc"][0] : 0.0;
    this.y = json.containsKey("loc") ? json["loc"][1] : 0.0;
    this.scaleX = json.containsKey("scale") ? json["scale"][0] : 1.0;
    this.scaleY = json.containsKey("scale") ? json["scale"][1] : 1.0;
    this.skewX = json.containsKey("skew") ? json["skew"][0] : 0.0;
    this.skewY = json.containsKey("skew") ? json["skew"][1] : 0.0;
    this.pivotX = json.containsKey("pivot") ? json["pivot"][0] : 0.0;
    this.pivotY = json.containsKey("pivot") ? json["pivot"][1] : 0.0;

    this.visible = json.containsKey("visible") ? json["visible"] : true;
    this.alpha = json.containsKey("alpha") ? json["alpha"] : 1.0;

    this.tweened = json.containsKey("tweened") ? json["tweened"] : true;
    this.ease = json.containsKey("ease") ? json["ease"] : 0.0;
  }
}