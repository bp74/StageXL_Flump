part of stagexl_flump;

class _FlumpLayerData {
  final String name;
  final bool flipbook;
  final List<_FlumpKeyframeData> flumpKeyframeDatas;

  int frames;

  _FlumpLayerData(Map json)
      : name = _ensureString(json['name']),
        flipbook = json.containsKey('flipbook')
            ? _ensureBool(json['flipbook'])
            : false,
        flumpKeyframeDatas = (json['keyframes'] as List)
            .map((keyframe) => _FlumpKeyframeData(keyframe))
            .toList() {
    frames = flumpKeyframeDatas.last.index + flumpKeyframeDatas.last.duration;
  }

  //-----------------------------------------------------------------------------------------------

  _FlumpKeyframeData getKeyframeForFrame(int frame) {
    for (var i = 1; i < flumpKeyframeDatas.length; i++) {
      if (flumpKeyframeDatas[i].index > frame) {
        return flumpKeyframeDatas[i - 1];
      }
    }
    return flumpKeyframeDatas.last;
  }

  _FlumpKeyframeData getKeyframeAfter(_FlumpKeyframeData flumpKeyframeData) {
    for (var i = 0; i < flumpKeyframeDatas.length - 1; i++) {
      if (identical(flumpKeyframeDatas[i], flumpKeyframeData)) {
        return flumpKeyframeDatas[i + 1];
      }
    }
    return null;
  }
}
