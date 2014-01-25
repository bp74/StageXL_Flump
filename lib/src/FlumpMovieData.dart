part of stagexl_flump;

class _FlumpMovieData {

  final String id;
  final FlumpLibrary flumpLibrary;
  final List<_FlumpLayerData> flumpLayerDatas;

  int frames = 0;

  _FlumpMovieData(FlumpLibrary flumpLibrary, Map json) :
    this.flumpLibrary = flumpLibrary,
    this.id = json["id"],
    this.flumpLayerDatas = json["layers"].map((layer) => new _FlumpLayerData(layer)).toList() {

    this.frames = flumpLayerDatas.fold(0, (f, data) => max(f, data.frames));
  }
}