part of stagexl_flump;

class _FlumpLayerData {

  final String name;
  final bool flipbook;
  final List<_FlumpKeyframeData> flumpKeyframeDatas;

  int frames;

  _FlumpLayerData(Map json) :
    this.name = _ensureString(json["name"]),
    this.flipbook = json.containsKey("flipbook") ? _ensureBool(json["flipbook"]) : false,
    this.flumpKeyframeDatas = json["keyframes"].map((keyframe) =>
        new _FlumpKeyframeData(keyframe)).toList() {

    this.frames = flumpKeyframeDatas.last.index + flumpKeyframeDatas.last.duration;
  }

  //-----------------------------------------------------------------------------------------------

  _FlumpKeyframeData getKeyframeForFrame(int frame) {
    for(int i = 1; i < flumpKeyframeDatas.length; i++) {
      if (flumpKeyframeDatas[i].index > frame) {
        return flumpKeyframeDatas[i - 1];
      }
    }
    return flumpKeyframeDatas.last;
  }

  _FlumpKeyframeData getKeyframeAfter(_FlumpKeyframeData flumpKeyframeData) {
    for(int i = 0; i < flumpKeyframeDatas.length - 1; i++) {
      if (identical(flumpKeyframeDatas[i], flumpKeyframeData)) {
        return flumpKeyframeDatas[i + 1];
      }
    }
    return null;
  }
}
