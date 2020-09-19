part of stagexl_flump;

class _FlumpMovieData {
  final String id;
  final FlumpLibrary flumpLibrary;
  final List<_FlumpLayerData> flumpLayerDatas;

  int frames = 0;

  _FlumpMovieData(FlumpLibrary flumpLibrary, Map json)
      : flumpLibrary = flumpLibrary,
        id = json['id'],
        flumpLayerDatas = (json['layers'] as List)
            .map((layer) => _FlumpLayerData(layer))
            .toList() {
    frames = flumpLayerDatas.fold(0, (f, data) => max(f, data.frames));
  }
}
