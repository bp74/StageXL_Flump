part of stagexl_flump;

class _FlumpMovieData {

  final String id;
  final FlumpLibrary flumpLibrary;
  final List<_FlumpLayerData> flumpLayerDatas = new List<_FlumpLayerData>();

  _FlumpMovieData(Map json, FlumpLibrary flumpLibrary) :
    flumpLibrary = flumpLibrary,
    id = json["id"] {

    for(var layer in json["layers"]) {
      var flumpLayerData = new _FlumpLayerData(layer);
      this.flumpLayerDatas.add(flumpLayerData);
    }
  }

  int get frames {
    var frames = 0;
    for(var flumpLayerData in flumpLayerDatas)
      frames = max(frames, flumpLayerData.frames);

    return frames;
  }
}