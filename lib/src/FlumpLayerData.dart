part of stagexl_flump;

class _FlumpLayerData {

  final String name;
  final bool flipbook;
  final List<_FlumpKeyframeData> flumpKeyframeDatas = new List<_FlumpKeyframeData>();

  _FlumpLayerData(Map json) :
    this.name = json["name"],
    this.flipbook = json.containsKey("flipbook") ? json["flipbook"] : false {

    for(var keyframe in json["keyframes"]) {
      var flumpKeyframeData = new _FlumpKeyframeData(keyframe);
      this.flumpKeyframeDatas.add(flumpKeyframeData);
    }
  }

  int get frames {
    var flumpKeyframeData = flumpKeyframeDatas[flumpKeyframeDatas.length - 1];
    return flumpKeyframeData.index + flumpKeyframeData.duration;
  }

  _FlumpKeyframeData getKeyframeForFrame(int frame) {
    var i  = 1;
    while(i < flumpKeyframeDatas.length && flumpKeyframeDatas[i].index <= frame) i++;
    return flumpKeyframeDatas[i - 1];
  }

  _FlumpKeyframeData getKeyframeAfter(_FlumpKeyframeData flumpKeyframeData) {
    for(int i = 0; i < flumpKeyframeDatas.length - 1; i++)
      if (identical(flumpKeyframeDatas[i], flumpKeyframeData))
        return flumpKeyframeDatas[i + 1];

    return null;
  }
}
